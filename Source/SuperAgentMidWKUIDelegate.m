//
//  SuperAgentMidWKUIDelegate.m
//  SuperAgentWeb
//
//  Created by yzy on 2020/12/9.
//

#import "SuperAgentMidWKUIDelegate.h"

@implementation SuperAgentMidWKUIDelegate

- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    if (self.delegate != nil) {
        return [self.delegate webView:webView createWebViewWithConfiguration:configuration forNavigationAction:navigationAction windowFeatures:windowFeatures];
    }
    return nil;
}

- (void)webViewDidClose:(WKWebView *)webView API_AVAILABLE(macos(10.11), ios(9.0)) {
    if (self.delegate != nil) {
        [self.delegate webViewDidClose:webView];
    }
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    if (self.delegate != nil) {
        [self.delegate webView:webView runJavaScriptAlertPanelWithMessage:message initiatedByFrame:frame completionHandler:completionHandler];
    }
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler {
    if (self.delegate != nil) {
        [self.delegate webView:webView runJavaScriptConfirmPanelWithMessage:message initiatedByFrame:frame completionHandler:completionHandler];
    }
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler {
    if (self.delegate != nil) {
        [self.delegate webView:webView runJavaScriptTextInputPanelWithPrompt:prompt defaultText:defaultText initiatedByFrame:frame completionHandler:completionHandler];
    }
}

- (BOOL)webView:(WKWebView *)webView shouldPreviewElement:(WKPreviewElementInfo *)elementInfo API_DEPRECATED_WITH_REPLACEMENT("webView:contextMenuConfigurationForElement:completionHandler:", ios(10.0, 13.0)) {
    if (self.delegate != nil) {
        return [self.delegate webView:webView shouldPreviewElement:elementInfo];
    }
    return NO;
}

- (nullable UIViewController *)webView:(WKWebView *)webView previewingViewControllerForElement:(WKPreviewElementInfo *)elementInfo defaultActions:(NSArray<id <WKPreviewActionItem>> *)previewActions API_DEPRECATED_WITH_REPLACEMENT("webView:contextMenuConfigurationForElement:completionHandler:", ios(10.0, 13.0)) {
    if (self.delegate != nil) {
        return [self.delegate webView:webView previewingViewControllerForElement:elementInfo defaultActions:previewActions];
    }
    return nil;
}

- (void)webView:(WKWebView *)webView commitPreviewingViewController:(UIViewController *)previewingViewController API_DEPRECATED_WITH_REPLACEMENT("webView:contextMenuForElement:willCommitWithAnimator:", ios(10.0, 13.0)) {
    if (self.delegate != nil) {
        [self.delegate webView:webView commitPreviewingViewController:previewingViewController];
    }
}

- (void)webView:(WKWebView *)webView contextMenuConfigurationForElement:(WKContextMenuElementInfo *)elementInfo completionHandler:(void (^)(UIContextMenuConfiguration * _Nullable configuration))completionHandler API_AVAILABLE(ios(13.0)) {
    if (self.delegate != nil) {
        [self.delegate webView:webView contextMenuConfigurationForElement:elementInfo completionHandler:completionHandler];
    }
}

- (void)webView:(WKWebView *)webView contextMenuWillPresentForElement:(WKContextMenuElementInfo *)elementInfo API_AVAILABLE(ios(13.0)) {
    if (self.delegate != nil) {
        [self.delegate webView:webView contextMenuWillPresentForElement:elementInfo];
    }
}

- (void)webView:(WKWebView *)webView contextMenuForElement:(WKContextMenuElementInfo *)elementInfo willCommitWithAnimator:(id <UIContextMenuInteractionCommitAnimating>)animator API_AVAILABLE(ios(13.0)) {
    if (self.delegate != nil) {
        [self.delegate webView:webView contextMenuForElement:elementInfo willCommitWithAnimator:animator];
    }
}

- (void)webView:(WKWebView *)webView contextMenuDidEndForElement:(WKContextMenuElementInfo *)elementInfo API_AVAILABLE(ios(13.0)) {
    if (self.delegate != nil) {
        [self.delegate webView:webView contextMenuDidEndForElement:elementInfo];
    }
}

@end
