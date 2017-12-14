//
//  TPSocialManager.h
//  taopaitang
//
//  Created by Perfectcjh on 2017/11/29.
//  Copyright © 2017年 refineit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TPSocialMessageObject.h"
#import "TPSocialConfig.h"

@interface TPSocialManager : NSObject

+ (instancetype)shareManager;

//在程序启动时调用
- (void)setupSocailPlatformKeyAndSecret;



//第三方授权登录
- (void)getUserInfoWithPlatform:(TPSocialPlatformType)platformType
          currentViewController:(id)currentViewController
                     completion:(TPSocialGetUserInfoCompletionHandler)completion;


//第三方分享
- (void)shareToPlatform:(TPSocialPlatformType)platformType
          messageObject:(TPSocialMessageObject *)messageObject
  currentViewController:(id)currentViewController
             completion:(TPSocialShareCompletionHandler)completion;





//获得从sso或者web端回调到本app的回调
- (BOOL)handleOpenURL:(NSURL *)url;

//判断平台是否安装
+ (BOOL)isInstall:(TPSocialPlatformType)platformType;

//判断平台是否支持跳转
+ (BOOL)isSupport:(TPSocialPlatformType)platformType;

@end
