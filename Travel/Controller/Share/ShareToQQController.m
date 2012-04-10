//
//  ShareToQQController.m
//  Travel
//
//  Created by haodong qiu on 12年4月7日.
//  Copyright (c) 2012年 orange. All rights reserved.
//

#import "ShareToQQController.h"
#import "LogUtil.h"
#import "LocaleUtils.h"
#import "QWeiboSyncApi.h"
#import "QWeiboAsyncApi.h"
#import "NSURL+QAdditions.h"

#define kQQWeiBoAppKey        @"801124726"
#define kQQWeiBoAppSecret     @"4cd1cd1882f68fe7a7a43df7761d30d9"
#define kQQAccessTokenKey       @"QQAccessTokenKey"
#define kQQAccessTokenSecret	@"QQAccessTokenSecret"
#define VERIFY_URL      @"http://open.t.qq.com/cgi-bin/authorize?oauth_token="

@interface ShareToQQController ()
@property (nonatomic, retain) NSString *accessTokenKey;
@property (nonatomic, retain) NSString *accessTokenSecret;
@property (nonatomic, retain) NSString *requestTokenKey;
@property (nonatomic, retain) NSString *requestTokenSecret;
@property (nonatomic, retain) UIWebView *authWebView;
@property (nonatomic, retain) UITextView *contentTextView;
@property (nonatomic, retain) UILabel *wordsNumberLabel;
@property (nonatomic, retain) NSURLConnection	*connection;

- (void)createSendView;
- (void)sendQQWeibo:(id)sender;
- (NSString*)valueForKey:(NSString *)key ofQuery:(NSString*)query;
- (void)loadDefaultKey;
- (void)authorizeQQWeibo;
@end

@implementation ShareToQQController
@synthesize accessTokenKey;
@synthesize accessTokenSecret;
@synthesize requestTokenKey;
@synthesize requestTokenSecret;
@synthesize authWebView;
@synthesize contentTextView;
@synthesize wordsNumberLabel;
@synthesize connection;

- (void)dealloc
{
    [accessTokenKey release];
    [accessTokenSecret release];
    [requestTokenKey release];
    [requestTokenSecret release];
    [authWebView release];
    [contentTextView release];
    [wordsNumberLabel release];
    [connection release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:84.0/255.0 green:154.0/255.0 blue:182.0/255.0 alpha:1.0];
    [self loadDefaultKey];
    
    [self setNavigationLeftButton:NSLS(@" 返回") 
                        imageName:@"back.png"
                           action:@selector(clickBack:)];
    
    [self setNavigationRightButton:NSLS(@"发送") 
                         imageName:@"topmenu_btn_right.png" 
                            action:@selector(sendQQWeibo:)];
    
    self.navigationItem.title = NSLS(@"分享到腾讯微博");
    
    [self createSendView];
    
    if (accessTokenKey == nil || accessTokenSecret ==nil) {
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
        //获取request_token
        QWeiboSyncApi *api = [[[QWeiboSyncApi alloc] init] autorelease];
        NSString *retString = [api getRequestTokenWithConsumerKey:kQQWeiBoAppKey consumerSecret:kQQWeiBoAppSecret];
        NSDictionary *params = [NSURL parseURLQueryString:retString];
        self.requestTokenKey = [params objectForKey:@"oauth_token"];
        self.requestTokenSecret = [params objectForKey:@"oauth_token_secret"];
        [self authorizeQQWeibo];
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self setAccessTokenKey:nil];
    [self setAccessTokenSecret:nil];
    [self setRequestTokenKey:nil];
    [self setRequestTokenSecret:nil];
    [self setAuthWebView:nil];
    [self setContentTextView:nil];
    [self setWordsNumberLabel:nil];
    [self setConnection:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma -mark Custom methods
#define WEIBO_LOGO_HEIGHT   30
#define WORDSNUMBER_WIDTH   30
#define WORDSNUMBER_HEIGHT  20
#define CONTENT_WIDTH       280
#define CONTENT_HEIGHT      120
- (void)createSendView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((320-CONTENT_WIDTH)/2, 0, 73, WEIBO_LOGO_HEIGHT)];
    imageView.image = [UIImage imageNamed:@"QQWeibo_logo.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((320-CONTENT_WIDTH)/2+CONTENT_WIDTH-WORDSNUMBER_WIDTH, WEIBO_LOGO_HEIGHT-WORDSNUMBER_HEIGHT, WORDSNUMBER_WIDTH, WORDSNUMBER_HEIGHT)];
    label.text = @"0";
    label.textAlignment = UITextAlignmentRight;
    label.textColor = [UIColor whiteColor];
    //label.backgroundColor = [UIColor blueColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:12];
    self.wordsNumberLabel = label;
    [label release];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake((320-CONTENT_WIDTH)/2, WEIBO_LOGO_HEIGHT, CONTENT_WIDTH, CONTENT_HEIGHT)];
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:13];
    textView.text = NSLS(@"朋友们，我发现了一款非常专业的旅游指南《大拇指旅游》，非常适合我们外出旅游使用，快下载来看看吧：http://xxxxxx");
    self.contentTextView = textView;
    [textView release];
    
    [self.view addSubview:wordsNumberLabel];
    [self.view addSubview:contentTextView];
    
    self.wordsNumberLabel.text = [NSString stringWithFormat:@"%d",[contentTextView.text length]];
}

- (void)sendQQWeibo:(id)sender
{
    [contentTextView resignFirstResponder];
    [self showActivity];
    QWeiboAsyncApi *api = [[[QWeiboAsyncApi alloc] init] autorelease];
	self.connection	= [api publishMsgWithConsumerKey:kQQWeiBoAppKey
									  consumerSecret:kQQWeiBoAppSecret
									  accessTokenKey:accessTokenKey
								   accessTokenSecret:accessTokenSecret
											 content:contentTextView.text 
										   imageFile:nil
										  resultType:RESULTTYPE_JSON 
											delegate:self];
}

- (NSString*)valueForKey:(NSString *)key ofQuery:(NSString*)query
{
	NSArray *pairs = [query componentsSeparatedByString:@"&"];
	for(NSString *aPair in pairs){
		NSArray *keyAndValue = [aPair componentsSeparatedByString:@"="];
		if([keyAndValue count] != 2) continue;
		if([[keyAndValue objectAtIndex:0] isEqualToString:key]){
			return [keyAndValue objectAtIndex:1];
		}
	}
	return nil;
}

- (void)loadDefaultKey {
	self.accessTokenKey = [[NSUserDefaults standardUserDefaults] valueForKey:kQQAccessTokenKey];
	self.accessTokenSecret = [[NSUserDefaults standardUserDefaults] valueForKey:kQQAccessTokenSecret];
}

- (void)authorizeQQWeibo
{
    UIWebView *webView= [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    webView.delegate = self;
    self.authWebView = webView;
    [webView release];
    
    [self.view addSubview:authWebView];
    NSString *url = [NSString stringWithFormat:@"%@%@", VERIFY_URL, requestTokenKey];
	NSURL *requestUrl = [NSURL URLWithString:url];
	NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
	[authWebView loadRequest:request];
}

#pragma -mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *query = [[request URL] query];
	NSString *verifier = [self valueForKey:@"oauth_verifier" ofQuery:query];
    PPDebug(@"%@",query);
    PPDebug(@"%@",verifier);
	
	if (verifier && ![verifier isEqualToString:@""]) {
		QWeiboSyncApi *api = [[[QWeiboSyncApi alloc] init] autorelease];
		NSString *retString = [api getAccessTokenWithConsumerKey:kQQWeiBoAppKey 
												  consumerSecret:kQQWeiBoAppSecret
												 requestTokenKey:requestTokenKey
											  requestTokenSecret:requestTokenSecret
														  verify:verifier];
        //获取access token
        NSDictionary *params = [NSURL parseURLQueryString:retString];
        self.accessTokenKey = [params objectForKey:@"oauth_token"];
        self.accessTokenSecret = [params objectForKey:@"oauth_token_secret"];
        [[NSUserDefaults standardUserDefaults] setValue:accessTokenKey forKey:kQQAccessTokenKey];
        [[NSUserDefaults standardUserDefaults] setValue:accessTokenSecret forKey:kQQAccessTokenSecret];
        [authWebView removeFromSuperview];
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
		return NO;
	}
	
	return YES;
}


#pragma -mark UITextViewDelegate 
- (void)textViewDidChange:(UITextView *)textView
{
    self.wordsNumberLabel.text = [NSString stringWithFormat:@"%d",[textView.text length]];
}

#pragma mark -
#pragma mark NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	PPDebug(@"<connection:didReceiveData:>");
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    PPDebug(@"<connection:didReceiveResponse:>");
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    PPDebug(@"<connectionDidFinishLoading:>");
	self.connection = nil;
    [self hideActivity];
    [self popupHappyMessage:NSLS(@"发送成功") title:nil];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    PPDebug(@"<connection:didFailWithError:>");
	self.connection = nil;
    [self hideActivity];
    [self popupUnhappyMessage:NSLS(@"发送失败") title:nil];
}

@end