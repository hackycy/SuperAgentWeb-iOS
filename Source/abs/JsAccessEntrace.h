//
//  JsAccessEntrace.h
//  SuperAgentWeb
//
//  Created by yzy on 2020/12/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JsAccessEntrace <NSObject>

@required

- (void)callJs:(NSString *) js;

@end

NS_ASSUME_NONNULL_END
