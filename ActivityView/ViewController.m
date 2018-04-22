//
//  ViewController.m
//  ActivityView
//
//  Created by GuoMeng on 2018/4/13.
//  Copyright © 2018年 增光. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
#import <Messages/Messages.h>
#import <MessageUI/MessageUI.h>

#import "CustomActivity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)share:(id)sender {
    
    //要分享的内容，加在一个数组里边，初始化UIActivityViewController
    NSString *textToShare = @"我是一条小青龙，我前面有犄角，后面有尾巴，我有一个小秘密，小秘密，就不告诉你！";
    UIImage *imageToShare = [UIImage imageNamed:@"xiaoqinglong"];
    NSURL *urlToShare = [NSURL fileURLWithPath:@"www.baidu.com"];
    NSArray *activityItems = @[urlToShare,textToShare,imageToShare];
    
    //自定义Activity
    CustomActivity * customActivit = [[CustomActivity alloc] initWithTitie:@"小青龙的自定义系统分享" withActivityImage:[UIImage imageNamed:@"xiaoqinglong"] withUrl:urlToShare withType:@"CustomActivity" withShareContext:activityItems];
    NSArray *activities = @[customActivit];
    
    /**
     创建分享视图控制器
     ActivityItems  在执行activity中用到的数据对象数组。数组中的对象类型是可变的，并依赖于应用程序管理的数据。例如，数据可能是由一个或者多个字符串/图像对象，代表了当前选中的内容。
     
     Activities  是一个UIActivity对象的数组，代表了应用程序支持的自定义服务。这个参数可以是nil。
     
     */
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:activities];
    
    //UIActivityViewControllerCompletionWithItemsHandler)(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError)  iOS >=8.0
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
        //初始化回调方法
        UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(NSString *activityType,BOOL completed,NSArray *returnedItems,NSError *activityError){
            NSLog(@"activityType :%@", activityType);
            
            if (completed){
                NSLog(@"completed");
            }else{
                NSLog(@"cancel");
            }
        };
        
        // 初始化completionHandler，当post结束之后（无论是done还是cancell）该blog都会被调用
        activityVC.completionWithItemsHandler = myBlock;
    }
//    else{////UIActivityViewControllerCompletionHandler (NSString * __nullable activityType, BOOL completed); iOS 6.0~8.0
//
//        UIActivityViewControllerCompletionHandler myBlock = ^(NSString *activityType,BOOL completed){
//            NSLog(@"activityType :%@", activityType);
//            if (completed){
//                NSLog(@"completed");
//            }
//            else{
//                NSLog(@"cancel");
//            }
//        };
//        // 初始化completionHandler，当post结束之后（无论是done还是cancell）该blog都会被调用
//        activityVC.completionHandler = myBlock;
//    }
    
    //Activity 类型又分为“操作”和“分享”两大类
    /*
     UIKIT_EXTERN NSString *const UIActivityTypePostToFacebook     NS_AVAILABLE_IOS(6_0);
     UIKIT_EXTERN NSString *const UIActivityTypePostToTwitter      NS_AVAILABLE_IOS(6_0);
     UIKIT_EXTERN NSString *const UIActivityTypePostToWeibo        NS_AVAILABLE_IOS(6_0);    //SinaWeibo
     UIKIT_EXTERN NSString *const UIActivityTypeMessage            NS_AVAILABLE_IOS(6_0);
     UIKIT_EXTERN NSString *const UIActivityTypeMail               NS_AVAILABLE_IOS(6_0);
     UIKIT_EXTERN NSString *const UIActivityTypePrint              NS_AVAILABLE_IOS(6_0);
     UIKIT_EXTERN NSString *const UIActivityTypeCopyToPasteboard   NS_AVAILABLE_IOS(6_0);
     UIKIT_EXTERN NSString *const UIActivityTypeAssignToContact    NS_AVAILABLE_IOS(6_0);
     UIKIT_EXTERN NSString *const UIActivityTypeSaveToCameraRoll   NS_AVAILABLE_IOS(6_0);
     UIKIT_EXTERN NSString *const UIActivityTypeAddToReadingList   NS_AVAILABLE_IOS(7_0);
     UIKIT_EXTERN NSString *const UIActivityTypePostToFlickr       NS_AVAILABLE_IOS(7_0);
     UIKIT_EXTERN NSString *const UIActivityTypePostToVimeo        NS_AVAILABLE_IOS(7_0);
     UIKIT_EXTERN NSString *const UIActivityTypePostToTencentWeibo NS_AVAILABLE_IOS(7_0);
     UIKIT_EXTERN NSString *const UIActivityTypeAirDrop            NS_AVAILABLE_IOS(7_0);
     */
    
    // 分享功能(Facebook, Twitter, 新浪微博, 腾讯微博...)需要你在手机上设置中心绑定了登录账户, 才能正常显示。
    //关闭系统的一些activity类型
    activityVC.excludedActivityTypes = @[];
    
    //在展现view controller时，必须根据当前的设备类型，使用适当的方法。在iPad上，必须通过popover来展现view controller。在iPhone和iPodtouch上，必须以模态的方式展现。
    [self presentViewController:activityVC animated:YES completion:nil];
    
}

- (void)SystemAPI{
    
    //复制链接功能
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = @"需要复制的内容";
    
    //用safari打开网址
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"www.baidu.com"]];
    
    //保存图片到相册
//    UIImage *image = [UIImage imageNamed:@"xiaoqinglong"];
//    void *contextInfo = NULL;
//    UIImageWriteToSavedPhotosAlbum(image, self, @selector(didWriteToSavedPhotosAlbum), contextInfo);
    
    
    //添加书签
//    NSURL *URL = [NSURL URLWithString:@"www.baidu.com"];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
