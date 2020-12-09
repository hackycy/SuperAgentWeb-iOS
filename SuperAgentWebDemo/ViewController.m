//
//  ViewController.m
//  SuperAgentWeb
//
//  Created by yzy on 2020/12/7.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController () <WKUIDelegate>

@property (strong, nonatomic) WKWebView* webView;
@property (weak, nonatomic) UIViewController* viewController;
@property (strong, nonatomic) UIAlertController* alertController;
@property (strong, nonatomic) SuperAgentDefaultWKUIDelegate* uidelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) configuration:[[WKWebViewConfiguration alloc] init]];
//    [[SuperAgentDefaultWKUIDelegate alloc] init];
    self.uidelegate = [[SuperAgentDefaultWKUIDelegate alloc] initWithViewController:self];
    self.webView.UIDelegate = self.uidelegate;
    [self.webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [self.view addSubview:self.webView];
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    NSLog(@"runJavaScriptAlertPanelWithMessage");
    self.alertController = [UIAlertController alertControllerWithTitle:webView.URL.host ?: @"" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [self.alertController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self presentViewController:self.alertController animated:YES completion:nil];
}



@end
