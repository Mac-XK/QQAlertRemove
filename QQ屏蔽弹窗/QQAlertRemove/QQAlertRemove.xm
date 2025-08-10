// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>

// QUIAlertView的前向声明
@interface QUIAlertView : UIView
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;
- (void)show;
@end

// 添加日志函数，方便调试
static void QQAlertLog(NSString *format, ...) {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    //NSLog(@"[小K] %@", message);
}

// 直接hook QUIAlertView
%hook QUIAlertView

// 拦截所有初始化方法
- (instancetype)init {
    QQAlertLog(@"拦截到QUIAlertView init");
    return nil; // 返回nil阻止弹窗创建
}

- (instancetype)initWithFrame:(CGRect)frame {
    QQAlertLog(@"拦截到QUIAlertView initWithFrame");
    return nil; // 返回nil阻止弹窗创建
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    QQAlertLog(@"拦截到QUIAlertView初始化: 标题=%@, 消息=%@", title, message);
    return nil; // 返回nil阻止弹窗创建
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    QQAlertLog(@"拦截到QUIAlertView initWithCoder");
    return nil; // 返回nil阻止弹窗创建
}

// 以防万一初始化方法没被拦截，也拦截show方法
- (void)show {
    QQAlertLog(@"拦截到QUIAlertView show方法");
    return; // 不调用原始方法，直接返回
}

// 拦截可能的其他显示方法
- (void)showWithAnimated:(BOOL)animated {
    QQAlertLog(@"拦截到QUIAlertView showWithAnimated方法");
    return;
}

%end

// 添加5分钟后闪退功能
%ctor {
    // 在主线程上延迟执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * 60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        QQAlertLog(@"已运行5分钟，准备闪退");
        // 强制退出应用
        //exit(0);
    });
    
    QQAlertLog(@"已设置5分钟后闪退");
}

