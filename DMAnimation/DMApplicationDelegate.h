//
//  DMApplicationDelegate.h
//  DMAnimation
//
//  Created by 张炯 on 2017/8/30.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@protocol DMApplicationDelegate <NSObject>


/**
 应用启动完成
 
 @param options 启动参数
 */
+ (void)dm_applicationDidFinishLaunchingWithOptions:(NSDictionary *)options;

/**
 程序暂行
 */
+ (void)dm_applicationWillResignActive;

/**
 程序已经进入后台
 */
+ (void)dm_applicationDidEnterBackground;

/**
 程序将要进入前台
 */
+ (void)dm_applicationWillEnterForeground;

/**
 程序已经被激活
 */
+ (void)dm_applicationDidBecomeActive;

/**
 程序将要被终止
 */
+ (void)dm_applicationWillTerminate;

/**
 3D-Touch
 
 @param shortcutItem touch对象
 @param completionHandler 完成block
 */
+ (void)dm_applicationPerformActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler;

/**
 app间调转
 */
+ (BOOL)dm_applicationOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

#if __IPHONE_OS_VERSION_MAX_ALLOWED > 80400
+ (BOOL)dm_applicationOpenURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options;
#endif

/**
 收到远程推送
 
 @param userInfo 推送信息
 */
+ (void)dm_applicationDidReceiveRemoteNotification:(NSDictionary *)userInfo;

+ (void)dm_applicationDidReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

/**
 收到本地推送
 
 @param notification 本地通知
 */
+ (void)dm_applicationDidReceiveLocalNotification:(UILocalNotification *)notification;

/**
 iOS10+ PresentNotification
 
 */
+ (void)dm_userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler;

/**
 iOS10+ DidReceiveNotificationResponse
 */
+ (void)dm_userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler;

/**
 DidUpdateUserActivity
 
 @param userActivity 模块事件item
 */
+ (void)dm_applicationDidUpdateUserActivity:(NSUserActivity *)userActivity;

/**
 DidFailToContinueUserActivity
 */
+ (void)dm_applicationDidFailToContinueUserActivityWithType:(NSString *)userActivityType error:(NSError *)error;

/**
 ContinueUserActivity
 */
+ (BOOL)dm_applicationContinueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * ))restorationHandler;

/**
 WillContinueUserActivity
 
 @param userActivityType 模块事件item
 */
+ (BOOL)dm_applicationWillContinueUserActivityWithType:(NSString *)userActivityType;

/**
 将要收到内存警告
 */
+ (void)dm_applicationDidReceiveMemoryWarning;


@end
