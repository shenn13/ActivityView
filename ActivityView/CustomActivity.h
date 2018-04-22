//
//  CustomActivity.h
//  ActivityView
//
//  Created by GuoMeng on 2018/4/13.
//  Copyright © 2018年 增光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomActivity : UIActivity

@property (nonatomic, copy) NSString * title;

@property (nonatomic, strong) UIImage * image;

@property (nonatomic, strong) NSURL * url;

@property (nonatomic, copy) NSString * type;

@property (nonatomic, strong) NSArray * shareContexts;

- (instancetype)initWithTitie:(NSString *)title withActivityImage:(UIImage *)image withUrl:(NSURL *)url withType:(NSString *)type  withShareContext:(NSArray *)shareContexts;

@end
