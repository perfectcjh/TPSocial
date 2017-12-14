//
//  TPSocialConfig.h
//  taopaitang
//
//  Created by Perfectcjh on 2017/11/29.
//  Copyright © 2017年 refineit. All rights reserved.
//

#ifndef TPSocialConfig_h
#define TPSocialConfig_h

// 微信参数
#define WXAppKey @"wxcf1d8c1d8b44355a"
#define WXAppSecret @"d33b35c12224e69fcfbdfebfd9c0893c"

// QQ参数
#define QQAppKey @"101446406"
#define QQAppSecret @"b1917d4aa575688765162aec00623b06"
#define QQRedirectURI @"www.qq.com"

// 微博参数
#define WeiboAppKey @"4265586224"
#define WeiboAppSecret @"bee840363b44d3d462d048e56751f4df"
#define WeiboRedirectURI @"https://api.weibo.com/oauth2/default.html"


//平台
typedef NS_ENUM(NSInteger, TPSocialPlatformType) {
    TPSocialPlatformType_UnKnown            = -1,//未知平台
    TPSocialPlatformType_Sina               = 0, //新浪
    TPSocialPlatformType_WechatSession      = 1, //微信
    TPSocialPlatformType_WechatTimeLine     = 2, //微信朋友圈
    TPSocialPlatformType_WechatFavorite     = 3, //微信收藏
    TPSocialPlatformType_QQ                 = 4, //QQ聊天页面
    TPSocialPlatformType_Qzone              = 5, //qq空间
    TPSocialPlatformType_TencentWb          = 6, //腾讯微博
};


//登录结果
typedef NS_ENUM(NSInteger, TPSocialGetUserInfoResult) {
    TPSocialGetUserInfoResult_Success         = 0, //成功
    TPSocialGetUserInfoResult_Cancel          = 1, //用户取消
    TPSocialGetUserInfoResult_Error           = 2, //失败
};


//分享结果
typedef NS_ENUM(NSInteger, TPSocialShareResult) {
    TPSocialShareResult_Success         = 0, //成功
    TPSocialShareResult_Cancel          = 1, //用户取消
    TPSocialShareResult_Error           = 2, //失败
};


//分享结果
typedef NS_ENUM(NSInteger, TPSocialCurrentActionType) {
    TPSocialCurrentActionType_UnKnown       = 0, //未知
    TPSocialCurrentActionType_GetUserInfo   = 1, //授权
    TPSocialCurrentActionType_Share         = 2, //分享
};


typedef void (^TPSocialGetUserInfoCompletionHandler)(TPSocialGetUserInfoResult result, NSDictionary *info);
typedef void (^TPSocialShareCompletionHandler)(TPSocialShareResult result, NSDictionary *info);

#endif /* TPSocialConfig_h */
