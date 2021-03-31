# TalkingData App Analytics SDK

[![Build status](https://github.com/ElfSundae/TalkingDataAppAnalytics/workflows/Build/badge.svg)](https://github.com/ElfSundae/TalkingDataAppAnalytics/actions?query=workflow%3ABuild)
![CocoaPods](https://img.shields.io/cocoapods/v/TalkingDataAppAnalytics)

[TalkingData](https://www.talkingdata.com) App Analytics 应用统计分析 SDK 的 CocoaPods 集成库。[SDK](SDK) 目录下包含官方 Demo 源码。

- 官方使用文档: https://doc.talkingdata.com/posts/20
- 官方 SDK 下载地址: https://doc.talkingdata.com/posts/58

## 安装

本 Pod 库包含两个可选版本：基础版（默认）、全功能版。

### 基础版

App Analytics 基础功能：常规 app 运营分析，包含应用启动、留存、用户分群、渠道统计、账户统计及漏斗分析等。

```ruby
pod 'TalkingDataAppAnalytics'
```

或：

```ruby
pod 'TalkingDataAppAnalytics/Basic'
```

### 全功能版

- App Analytics 基础功能
- 用户质量评估
- 标准化事件分析
- 自定义事件
- 智能用户识别及画像
- 灵动分析
- 推送营销
- 页面统计

```ruby
pod 'TalkingDataAppAnalytics/Full'
```

## Example

```objc
#import <TalkingDataAppAnalytics/TalkingDataAppAnalytics.h>

NSString *UDID = [UIDevice.currentDevice talkingDataDeviceIdentifier];
```
