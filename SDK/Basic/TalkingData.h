//
//  TalkingData.h
//  __MyProjectName__
//
//  Created by Biao Hou on 11-11-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#if TARGET_OS_IOS
typedef NS_ENUM(NSUInteger, TDAccountType) {
    TDAccountTypeAnonymous      = 0,    // 匿名账户
    TDAccountTypeRegistered     = 1,    // 显性注册账户
    TDAccountTypeSinaWeibo      = 2,    // 新浪微博
    TDAccountTypeQQ             = 3,    // QQ账户
    TDAccountTypeTencentWeibo   = 4,    // 腾讯微博
    TDAccountTypeND91           = 5,    // 91账户
    TDAccountTypeWeiXin         = 6,    // 微信
    TDAccountTypeType1          = 11,   // 自定义类型1
    TDAccountTypeType2          = 12,   // 自定义类型2
    TDAccountTypeType3          = 13,   // 自定义类型3
    TDAccountTypeType4          = 14,   // 自定义类型4
    TDAccountTypeType5          = 15,   // 自定义类型5
    TDAccountTypeType6          = 16,   // 自定义类型6
    TDAccountTypeType7          = 17,   // 自定义类型7
    TDAccountTypeType8          = 18,   // 自定义类型8
    TDAccountTypeType9          = 19,   // 自定义类型9
    TDAccountTypeType10         = 20    // 自定义类型10
};
#endif




@interface TalkingData: NSObject

/**
 *  @method getDeviceID
 *  获取SDK所使用的DeviceID
 *  @return DeviceID
 */
+ (NSString *)getDeviceID;

/**
 *  @method setLogEnabled
 *  统计日志开关（可选）
 *  @param  enable      默认是开启状态
 */
+ (void)setLogEnabled:(BOOL)enable;

#if TARGET_OS_IOS
/**
 *  @method setExceptionReportEnabled
 *  是否捕捉程序崩溃记录（可选）
 *  如果需要记录程序崩溃日志，请将值设成YES，并且在初始化后尽早调用
 *  @param  enable      默认是 NO
 */
+ (void)setExceptionReportEnabled:(BOOL)enable;

/**
 *  @method setSignalReportEnabled
 *  是否捕捉异常信号（可选）
 *  如果需要开启异常信号捕捉功能，请将值设成YES，并且在初始化后尽早调用
 *  @param  enable      默认是NO
 */
+ (void)setSignalReportEnabled:(BOOL)enable;
#endif



#if TARGET_OS_IOS
/**
 *  @method setLatitude:longitude:
 *  设置位置信息（可选）
 *  @param  latitude    维度
 *  @param  longitude   经度
 */
+ (void)setLatitude:(double)latitude longitude:(double)longitude;
#endif

/**
 *  @method backgroundSessionEnabled
 *  开启后台使用时长统计，需在SDK初始化之前调用。
 */
+ (void)backgroundSessionEnabled;

#if TARGET_OS_IOS
/**
 *  @method sessionStarted:withChannelId:
 *  初始化统计实例，请在application:didFinishLaunchingWithOptions:方法里调用
 *  @param  appKey      应用的唯一标识，统计后台注册得到
 *  @param  channelId   渠道名，如“app store”（可选）
 */
+ (void)sessionStarted:(NSString *)appKey withChannelId:(NSString *)channelId;
#endif




/**
 *  @method setAccountId:
 *  设置帐户ID
 *  @param  accountId   账户ID
 */
+ (void)setAccountId:(NSString *)accountId API_DEPRECATED("", ios(1, 1));

#if TARGET_OS_IOS
/**
 *  @method onRegister  注册
 *  @param  accountId   账户ID
 *  @param  type        账户类型
 *  @param  name        账户昵称
 */
+ (void)onRegister:(NSString *)accountId type:(TDAccountType)type name:(NSString *)name;

/**
 *  @method onLogin     登录
 *  @param  accountId   账户ID
 *  @param  type        账户类型
 *  @param  name        账户昵称
 */
+ (void)onLogin:(NSString *)accountId type:(TDAccountType)type name:(NSString *)name;

#endif









@end
