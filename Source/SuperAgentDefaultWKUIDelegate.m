//
//  SuperAgentDefaultWKUIDelegate.m
//  SuperAgentWeb
//
//  Created by yzy on 2020/12/9.
//

#import "SuperAgentDefaultWKUIDelegate.h"
#import "SuperAgentWebDefine.h"
#import <UIKit/UIKit.h>

@interface SuperAgentDefaultWKUIDelegate ()

@property (weak, nonatomic) UIViewController* viewController;
@property (strong, nonatomic) UIAlertController* alertController;
@property (strong, nonatomic) UIAlertController* confirmController;
@property (strong, nonatomic) UIAlertController* promptController;

@end

@implementation SuperAgentDefaultWKUIDelegate

- (instancetype) initWithViewController:(UIViewController *)viewController {
    if (self = [super init]) {
        self.viewController = viewController;
    }
    return self;
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    NSLog(@"runJavaScriptAlertPanelWithMessage");
    self.alertController = [UIAlertController alertControllerWithTitle:webView.URL.host ?: @"" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [self.alertController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self.viewController presentViewController:self.alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    self.confirmController = [UIAlertController alertControllerWithTitle:@"" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [self.confirmController addAction:([UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [self.confirmController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [self.viewController presentViewController:self.confirmController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    self.promptController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [self.promptController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [self.promptController addAction:([UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(self.promptController.textFields[0].text?:@"");
    }])];
    [self.viewController presentViewController:self.promptController animated:YES completion:nil];
}

/// 弹出窗口 _blank 处理
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}

@end
