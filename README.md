# QQAlertRemove - QQ弹窗屏蔽插件

[English](#english) | [中文](#chinese)

---

## <a id="chinese"></a>中文说明

### 项目概述

QQAlertRemove 是一个专为 iOS 设备开发的 Cydia 插件（越狱插件），**这是一个客户定制的插件**，主要功能是屏蔽 QQ 应用中的各种弹窗提醒。该插件使用 Theos 框架和 Logos 语法开发，通过 Method Swizzling（方法交换）技术来拦截和阻止 QQ 应用中的弹窗显示。

### 主要功能

1. **弹窗拦截**: 通过 Hook QQ 应用中的 `QUIAlertView` 类，拦截所有弹窗的初始化和显示方法
2. **多重拦截**: 覆盖多个初始化方法确保弹窗无法创建
3. **显示阻止**: 即使弹窗创建成功，也会阻止其显示
4. **调试日志**: 提供详细的日志记录功能（可选开启）
5. **安全机制**: 包含5分钟自动退出机制（已注释，可选启用）

### 技术实现

#### 核心技术栈
- **开发框架**: Theos
- **编程语言**: Objective-C++ (.xm 文件)
- **Hook 技术**: Logos 语法
- **目标平台**: iOS (iphoneos-arm)
- **依赖**: MobileSubstrate, iOS 5.0+

#### 实现原理

插件通过以下方式工作：

1. **类声明**: 首先声明 `QUIAlertView` 接口，这是 QQ 应用中负责显示弹窗的类
2. **方法拦截**: 使用 `%hook` 指令拦截 `QUIAlertView` 类的关键方法：
   - `init` - 默认初始化方法
   - `initWithFrame:` - 带框架参数的初始化方法
   - `initWithTitle:message:` - 带标题和消息的初始化方法
   - `initWithCoder:` - 从编码器初始化的方法
   - `show` - 显示弹窗的方法
   - `showWithAnimated:` - 带动画显示弹窗的方法

3. **返回值控制**: 
   - 对于初始化方法，返回 `nil` 阻止对象创建
   - 对于显示方法，直接返回而不调用原始实现

### 文件结构

```
QQAlertRemove/
├── QQAlertRemove.xm          # 主要源代码文件
├── QQAlertRemove.mm          # 辅助源代码文件
├── QQAlertRemove-Prefix.pch  # 预编译头文件
└── Package/                  # 打包相关文件
    ├── DEBIAN/
    │   └── control           # Debian 包控制文件
    └── Library/
        └── MobileSubstrate/  # MobileSubstrate 相关文件
```

### 安装要求

- 已越狱的 iOS 设备
- iOS 5.0 或更高版本
- 已安装 MobileSubstrate
- 已安装 Cydia 包管理器

### 使用说明

1. 将编译好的 .deb 包通过 Cydia 安装
2. 重启设备或重启 SpringBoard
3. 打开 QQ 应用，插件将自动生效
4. 所有 QQ 弹窗将被自动屏蔽

### 安全特性

- **模拟器检测**: 代码包含模拟器检测，确保只在真实设备上运行
- **安全退出**: 包含可选的5分钟自动退出机制（当前已注释）
- **日志控制**: 调试日志可以通过注释/取消注释来控制

### 开发者信息

- **作者**: MacXK
- **包名**: com.MacXK.QQAlertRemove
- **版本**: 0.1-1
- **项目性质**: 客户定制插件

---

## <a id="english"></a>English Documentation

### Project Overview

QQAlertRemove is a Cydia tweak (jailbreak plugin) developed for iOS devices, **this is a custom plugin developed for a specific client**, designed to block various popup alerts in the QQ application. The plugin is developed using the Theos framework and Logos syntax, utilizing Method Swizzling technology to intercept and prevent popup displays in the QQ app.

### Main Features

1. **Popup Interception**: Hooks the `QUIAlertView` class in QQ app to intercept all popup initialization and display methods
2. **Multiple Interception**: Covers multiple initialization methods to ensure popups cannot be created
3. **Display Prevention**: Even if popups are successfully created, prevents them from being displayed
4. **Debug Logging**: Provides detailed logging functionality (optional)
5. **Safety Mechanism**: Includes a 5-minute auto-exit mechanism (commented out, optional)

### Technical Implementation

#### Core Technology Stack
- **Development Framework**: Theos
- **Programming Language**: Objective-C++ (.xm files)
- **Hook Technology**: Logos syntax
- **Target Platform**: iOS (iphoneos-arm)
- **Dependencies**: MobileSubstrate, iOS 5.0+

#### Implementation Principle

The plugin works through the following approach:

1. **Class Declaration**: First declares the `QUIAlertView` interface, which is the class responsible for displaying popups in QQ app
2. **Method Interception**: Uses `%hook` directive to intercept key methods of `QUIAlertView` class:
   - `init` - Default initialization method
   - `initWithFrame:` - Initialization method with frame parameter
   - `initWithTitle:message:` - Initialization method with title and message
   - `initWithCoder:` - Initialization method from coder
   - `show` - Method to display popup
   - `showWithAnimated:` - Method to display popup with animation

3. **Return Value Control**: 
   - For initialization methods, returns `nil` to prevent object creation
   - For display methods, returns directly without calling original implementation

### File Structure

```
QQAlertRemove/
├── QQAlertRemove.xm          # Main source code file
├── QQAlertRemove.mm          # Auxiliary source code file
├── QQAlertRemove-Prefix.pch  # Precompiled header file
└── Package/                  # Packaging related files
    ├── DEBIAN/
    │   └── control           # Debian package control file
    └── Library/
        └── MobileSubstrate/  # MobileSubstrate related files
```

### Installation Requirements

- Jailbroken iOS device
- iOS 5.0 or higher
- MobileSubstrate installed
- Cydia package manager installed

### Usage Instructions

1. Install the compiled .deb package through Cydia
2. Restart device or respring SpringBoard
3. Open QQ application, the plugin will automatically take effect
4. All QQ popups will be automatically blocked

### Security Features

- **Simulator Detection**: Code includes simulator detection to ensure it only runs on real devices
- **Safe Exit**: Includes optional 5-minute auto-exit mechanism (currently commented out)
- **Log Control**: Debug logging can be controlled by commenting/uncommenting

### Developer Information

- **Author**: MacXK
- **Package Name**: com.MacXK.QQAlertRemove
- **Version**: 0.1-1
- **Project Type**: Custom Client Plugin

---

## 技术细节 / Technical Details

### Hook 方法详解 / Hook Methods Explained

<augment_code_snippet path="QQAlertRemove/QQAlertRemove.xm" mode="EXCERPT">
````objective-c
%hook QUIAlertView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    QQAlertLog(@"拦截到QUIAlertView初始化: 标题=%@, 消息=%@", title, message);
    return nil; // 返回nil阻止弹窗创建
}

- (void)show {
    QQAlertLog(@"拦截到QUIAlertView show方法");
    return; // 不调用原始方法，直接返回
}

%end
````
</augment_code_snippet>

### 构造函数机制 / Constructor Mechanism

<augment_code_snippet path="QQAlertRemove/QQAlertRemove.xm" mode="EXCERPT">
````objective-c
%ctor {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * 60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        QQAlertLog(@"已运行5分钟，准备闪退");
        //exit(0);
    });
}
````
</augment_code_snippet>

---

## 免责声明 / Disclaimer

**中文**: 此插件仅供学习和研究目的使用。使用此插件可能违反 QQ 应用的服务条款。用户需自行承担使用风险。

**English**: This plugin is for educational and research purposes only. Using this plugin may violate QQ application's terms of service. Users assume all risks associated with its use.
