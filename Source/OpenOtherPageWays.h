//
//  OpenOtherPageWays.m
//  SuperAgentWeb
//
//  Created by yzy on 2020/12/8.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OpenOtherPageWays) {
    OpenOtherPageWaysDerect,    // 直接打开跳转页
    OpenOtherPageWaysAsk,       // 咨询用户是否打开
    OpenOtherPageWaysDisallow   // 禁止打开其他页面
};
