//
//  TPSocialManager.m
//  taopaitang
//
//  Created by Perfectcjh on 2017/11/29.
//  Copyright © 2017年 refineit. All rights reserved.
//

#import "TPSocialManager.h"
#import "TPTThirdLoginEngine.h"
#import "TPTThirdShareEngine.h"
#import "TPTThirdPayEngine.h"
#import <WXApi.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <WeiboSDK.h>

@interface TPSocialManager ()

@property (nonatomic, assign) TPSocialCurrentActionType currentActionType;
@property (nonatomic, assign) TPSocialPlatformType getUserInfoPlatformType;
@property (nonatomic, assign) TPSocialPlatformType sharePlatformType;
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, copy) TPSocialGetUserInfoCompletionHandler getUserInfoHandler;

@end

@implementation TPSocialManager

+ (instancetype)shareManager
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}


#pragma mark - public
//在程序启动时调用
- (void)setupSocailPlatformKeyAndSecret
{
    [TPTThirdLoginEngine sharedSingletonTool];
    [TPTThirdShareEngine sharedSingletonTool];
}


//第三方授权登录
- (void)getUserInfoWithPlatform:(TPSocialPlatformType)platformType
          currentViewController:(id)currentViewController
                     completion:(TPSocialGetUserInfoCompletionHandler)completion
{
//    self.getUserInfoPlatformType = platformType;
//    self.currentViewController = currentViewController;
//    self.getUserInfoHandler = completion;
    self.currentActionType = TPSocialCurrentActionType_GetUserInfo;
    [[TPTThirdLoginEngine sharedSingletonTool] getUserInfoFromPlatform:platformType shareResult:completion];
}


//第三方分享
- (void)shareToPlatform:(TPSocialPlatformType)platformType
          messageObject:(TPSocialMessageObject *)messageObject
  currentViewController:(id)currentViewController
             completion:(TPSocialShareCompletionHandler)completion
{
//    self.sharePlatformType = platformType;
//    self.currentViewController = currentViewController;
//    self.shareHandler = completion;
    self.currentActionType = TPSocialCurrentActionType_Share;
    [[TPTThirdShareEngine sharedSingletonTool] shareToPlatform:platformType
                                                 messageObject:messageObject
                                                   shareResult:completion];
}




//获得从sso或者web端回调到本app的回调
- (BOOL)handleOpenURL:(NSURL *)url
{
    if ([url.scheme isEqualToString:[NSString stringWithFormat:@"%@", WXAppKey]]) {
        if (self.currentActionType == TPSocialCurrentActionType_GetUserInfo) {
            return  [WXApi handleOpenURL:url delegate:[TPTThirdLoginEngine sharedSingletonTool]];
        }
        if (self.currentActionType == TPSocialCurrentActionType_Share) {
            return  [WXApi handleOpenURL:url delegate:[TPTThirdShareEngine sharedSingletonTool]];
        }
    } else if ([url.scheme isEqualToString:[NSString stringWithFormat:@"tencent%@", QQAppKey]]) {
        return  [TencentOAuth HandleOpenURL:url];
    } else if ([url.scheme isEqualToString:[NSString stringWithFormat:@"wb%@", WeiboAppKey]]) {
        if (self.currentActionType == TPSocialCurrentActionType_GetUserInfo) {
            return  [WeiboSDK handleOpenURL:url delegate:[TPTThirdLoginEngine sharedSingletonTool]];
        }
        if (self.currentActionType == TPSocialCurrentActionType_Share) {
            return  [WeiboSDK handleOpenURL:url delegate:[TPTThirdShareEngine sharedSingletonTool]];
        }
    }
    
//    if ([url.scheme hasPrefix:@"wx"]) { // 微信
//        return [TPTThirdPayEngine wechatHandleOpenURL:url];
//    } else if ([url.scheme hasPrefix:@"UnionPay"]) { // 银联
//        return [TPTThirdPayEngine unionHandleOpenURL:url];
//    } else if ([url.scheme hasPrefix:@"safepay"]) { // 支付宝
//        return [TPTThirdPayEngine alipayHandleOpenURL:url];
//    }
    
    return NO;
}


//判断平台是否安装
+ (BOOL)isInstall:(TPSocialPlatformType)platformType
{
    if (platformType == TPSocialPlatformType_WechatSession || platformType ==  TPSocialPlatformType_WechatTimeLine || platformType == TPSocialPlatformType_WechatFavorite) {
        return [WXApi isWXAppInstalled];
    }
    if (platformType == TPSocialPlatformType_Sina) {
        return [WeiboSDK isWeiboAppInstalled];
    }
    if (platformType == TPSocialPlatformType_QQ || platformType == TPSocialPlatformType_Qzone) {
        return [TencentOAuth iphoneQQInstalled];
    }
    return NO;
}

//判断平台是否支持跳转
+ (BOOL)isSupport:(TPSocialPlatformType)platformType
{
    if (platformType == TPSocialPlatformType_WechatSession || platformType ==  TPSocialPlatformType_WechatTimeLine || platformType == TPSocialPlatformType_WechatFavorite) {
        return [WXApi isWXAppSupportApi];
    }
    if (platformType == TPSocialPlatformType_Sina) {
        return [WeiboSDK isCanShareInWeiboAPP];
    }
    if (platformType == TPSocialPlatformType_QQ || platformType == TPSocialPlatformType_Qzone) {
        return [TencentOAuth iphoneQQSupportSSOLogin];
    }
    return NO;
}





@end
