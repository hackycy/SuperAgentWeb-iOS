//
//  SuperAgentWebDefine.h
//  SuperAgentWeb
//
//  Created by yzy on 2020/12/9.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - WebLayout相关

@protocol SuperAgentBaseIndicatorSpec <NSObject>

@required

- (void)show;

- (void)hide;

- (void)reset;

- (void)setProgress;

@end

@protocol SuperAgentWebIndicator <NSObject>

@required

- (id<SuperAgentBaseIndicatorSpec>)offer;

@end

@protocol SuperAgentWebCreator <NSObject>

@required

- (id<SuperAgentWebCreator>)create;

- (WKWebView *)getWKWebView;

- (UIView *)getWebParentLayout;

@end

@protocol SuperAgentIndicatorController <NSObject>

@required

- (void)progress:(WKWebView *) webView setNewProgress:(NSUInteger) newProgress;

- (id<SuperAgentBaseIndicatorSpec>)offerIndicator;

- (void)showIndicator;

- (void)setProgress:(NSUInteger) newProgress;

- (void)finish;

@end

@protocol SuperAgentWebLayout <NSObject>

// WKWebView的父控件
- (UIView *)getLayout;

// 返回 WebView  或 WebView 的子View ，返回null AgentWeb 内部会创建适当 WebView
- (WKWebView *)getWKWebView;

@end

#pragma mark - 功能相关

@protocol SuperAgentWebWebLifeCycle <NSObject>

@required

- (void)onDestroy;

@end

@protocol SuperAgentWebUrlLoader <NSObject>

@required

- (void)loadUrl:(NSURL *)url;

- (void)reload;

@end

@protocol SuperAgentExecutorFactory <NSObject>

@required

- (NSString *)exec:(NSString *)url withFunc:(NSString *)func withParamString:(NSString *) paramString;

@end

@protocol ConstraintsOffer <NSObject>

@required

- (NSArray<NSLayoutConstraint *> *)offer;

@end

NS_ASSUME_NONNULL_END
