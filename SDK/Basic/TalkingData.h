//
//  TalkingData.h
//  __MyProjectName__
//
//  Created by Biao Hou on 11-11-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#if TARGET_OS_IOS
typedef NS_ENUM(NSUInteger, TDProfileType) {
    TDProfileTypeAnonymous      = 0,    // 匿名账户
    TDProfileTypeRegistered     = 1,    // 显性注册账户
    TDProfileTypeSinaWeibo      = 2,    // 新浪微博
    TDProfileTypeQQ             = 3,    // QQ账户
    TDProfileTypeTencentWeibo   = 4,    // 腾讯微博
    TDProfileTypeND91           = 5,    // 91账户
    TDProfileTypeWeiXin         = 6,    // 微信
    TDProfileTypeType1          = 11,   // 自定义类型1
    TDProfileTypeType2          = 12,   // 自定义类型2
    TDProfileTypeType3          = 13,   // 自定义类型3
    TDProfileTypeType4          = 14,   // 自定义类型4
    TDProfileTypeType5          = 15,   // 自定义类型5
    TDProfileTypeType6          = 16,   // 自定义类型6
    TDProfileTypeType7          = 17,   // 自定义类型7
    TDProfileTypeType8          = 18,   // 自定义类型8
    TDProfileTypeType9          = 19,   // 自定义类型9
    TDProfileTypeType10         = 20    // 自定义类型10
};
#endif




typedef NS_ENUM(NSUInteger, TDVendorIdType) {
    TDVendorIdTypeZX = 1, // 卓信
    TDVendorIdTypeGX = 2, // 广协
};

@interface TalkingData: NSObject

/**
 *  @method getDeviceID
 *  获取SDK所使用的DeviceID
 *  @return DeviceID
 */
+ (NSString *)getDeviceID;

+ (void)setVendorID:(NSString *)vendorID ofType:(TDVendorIdType)type;

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
 *  @method setProfileId:
 *  设置帐户ID
 *  @param  profileId   账户ID
 */
+ (void)setProfileId:(NSString *)profileId API_DEPRECATED("", ios(1, 1));


#if TARGET_OS_IOS
/**
 *  @method onRegister  注册
 *  @param  profileId   账户ID
 *  @param  type        账户类型
 *  @param  name        账户昵称
 */
+ (void)onRegister:(NSString *)profileId type:(TDProfileType)type name:(NSString *)name;

/**
 *  @method onLogin     登录
 *  @param  profileId   账户ID
 *  @param  type        账户类型
 *  @param  name        账户昵称
 */
+ (void)onLogin:(NSString *)profileId type:(TDProfileType)type name:(NSString *)name;
#endif






@end
