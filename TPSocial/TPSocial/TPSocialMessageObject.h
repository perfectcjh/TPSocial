//
//  TPTSocialMessageObject.h
//  taopaitang
//
//  Created by Perfectcjh on 2017/11/29.
//  Copyright © 2017年 refineit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TPSocialMessageObject : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *imageUrl;   //缩略图链接

@property (strong, nonatomic) UIImage  *thumbImage; //缩略图
@property (strong, nonatomic) UIImage  *bigImage;   //微博有大图可以使用
//@property (strong, nonatomic) NSString *imageType;
//
//@property (strong, nonatomic) NSString *weixinPyqtitle;
//@property (strong, nonatomic) NSString *qqTitle;
//
//@property (strong, nonatomic) NSString *urlString;//
//@property (strong, nonatomic) NSString *urlImageString;// QQ,QQ空间分享加载图片用的
////@property (strong, nonatomic) NSURL    *url;
//@property (strong, nonatomic) NSString *summary;
//@property (strong, nonatomic) NSString *type;

- (instancetype)initWithTitle:(NSString *)title
                      content:(NSString *)content
                          url:(NSString *)url
                     imageUrl:(NSString *)imageUrl
                   thumbImage:(UIImage *)thumbImage
                     bigImage:(UIImage *)bigImage;

@end
