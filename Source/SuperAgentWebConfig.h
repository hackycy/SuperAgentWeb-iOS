//
//  SuperAgentWebConfig.h
//  SuperAgentWeb
//
//  Created by yzy on 2020/12/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const _Nonnull SuperAgentWebName;

#pragma mark - OpenOtherPageWays

typedef NS_ENUM(NSInteger, OpenOtherPageWays) {
    OpenOtherPageWaysDerect,    // 直接打开跳转页
    OpenOtherPageWaysAsk,       // 咨询用户是否打开
    OpenOtherPageWaysDisallow   // 禁止打开其他页面
};

#pragma mark - JsAccessEntrace

@protocol JsAccessEntrace <NSObject>

@required

- (void)callJs:(NSString *) js;

@end

#pragma mark - SuperAgentWebConfig

@interface SuperAgentWebConfig : NSObject


@end

NS_ASSUME_NONNULL_END
