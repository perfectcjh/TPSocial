//
//  TPTSocialMessageObject.m
//  taopaitang
//
//  Created by Perfectcjh on 2017/11/29.
//  Copyright © 2017年 refineit. All rights reserved.
//

#import "TPSocialMessageObject.h"

@implementation TPSocialMessageObject

- (instancetype)initWithTitle:(NSString *)title
                      content:(NSString *)content
                          url:(NSString *)url
                     imageUrl:(NSString *)imageUrl
                   thumbImage:(UIImage *)thumbImage
                     bigImage:(UIImage *)bigImage
{
    if (self = [super init]) {
        self.title = title;
        self.content = content;
        self.url = url;
        self.imageUrl = imageUrl;
        self.thumbImage = thumbImage;
        self.bigImage = bigImage;
    }
    return self;
}

@end
