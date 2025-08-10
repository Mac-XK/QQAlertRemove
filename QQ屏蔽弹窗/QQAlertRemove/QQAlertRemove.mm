#line 1 "/Users/macxk/Desktop/UI调试/小工具/已开发/QQ屏蔽弹窗/QQAlertRemove/QQAlertRemove.xm"


#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>


@interface QUIAlertView : UIView
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;
- (void)show;
@end


static void QQAlertLog(NSString *format, ...) {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    
}



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

__asm__(".linker_option \"-framework\", \"CydiaSubstrate\"");

@class QUIAlertView; 
static QUIAlertView* (*_logos_orig$_ungrouped$QUIAlertView$init)(_LOGOS_SELF_TYPE_INIT QUIAlertView*, SEL) _LOGOS_RETURN_RETAINED; static QUIAlertView* _logos_method$_ungrouped$QUIAlertView$init(_LOGOS_SELF_TYPE_INIT QUIAlertView*, SEL) _LOGOS_RETURN_RETAINED; static QUIAlertView* (*_logos_orig$_ungrouped$QUIAlertView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT QUIAlertView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static QUIAlertView* _logos_method$_ungrouped$QUIAlertView$initWithFrame$(_LOGOS_SELF_TYPE_INIT QUIAlertView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static QUIAlertView* (*_logos_orig$_ungrouped$QUIAlertView$initWithTitle$message$)(_LOGOS_SELF_TYPE_INIT QUIAlertView*, SEL, NSString *, NSString *) _LOGOS_RETURN_RETAINED; static QUIAlertView* _logos_method$_ungrouped$QUIAlertView$initWithTitle$message$(_LOGOS_SELF_TYPE_INIT QUIAlertView*, SEL, NSString *, NSString *) _LOGOS_RETURN_RETAINED; static QUIAlertView* (*_logos_orig$_ungrouped$QUIAlertView$initWithCoder$)(_LOGOS_SELF_TYPE_INIT QUIAlertView*, SEL, NSCoder *) _LOGOS_RETURN_RETAINED; static QUIAlertView* _logos_method$_ungrouped$QUIAlertView$initWithCoder$(_LOGOS_SELF_TYPE_INIT QUIAlertView*, SEL, NSCoder *) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$QUIAlertView$show)(_LOGOS_SELF_TYPE_NORMAL QUIAlertView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$QUIAlertView$show(_LOGOS_SELF_TYPE_NORMAL QUIAlertView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$QUIAlertView$showWithAnimated$)(_LOGOS_SELF_TYPE_NORMAL QUIAlertView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$QUIAlertView$showWithAnimated$(_LOGOS_SELF_TYPE_NORMAL QUIAlertView* _LOGOS_SELF_CONST, SEL, BOOL); 

#line 26 "/Users/macxk/Desktop/UI调试/小工具/已开发/QQ屏蔽弹窗/QQAlertRemove/QQAlertRemove.xm"



static QUIAlertView* _logos_method$_ungrouped$QUIAlertView$init(_LOGOS_SELF_TYPE_INIT QUIAlertView* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    QQAlertLog(@"拦截到QUIAlertView init");
    return nil; 
}

static QUIAlertView* _logos_method$_ungrouped$QUIAlertView$initWithFrame$(_LOGOS_SELF_TYPE_INIT QUIAlertView* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {
    QQAlertLog(@"拦截到QUIAlertView initWithFrame");
    return nil; 
}

static QUIAlertView* _logos_method$_ungrouped$QUIAlertView$initWithTitle$message$(_LOGOS_SELF_TYPE_INIT QUIAlertView* __unused self, SEL __unused _cmd, NSString * title, NSString * message) _LOGOS_RETURN_RETAINED {
    QQAlertLog(@"拦截到QUIAlertView初始化: 标题=%@, 消息=%@", title, message);
    return nil; 
}

static QUIAlertView* _logos_method$_ungrouped$QUIAlertView$initWithCoder$(_LOGOS_SELF_TYPE_INIT QUIAlertView* __unused self, SEL __unused _cmd, NSCoder * coder) _LOGOS_RETURN_RETAINED {
    QQAlertLog(@"拦截到QUIAlertView initWithCoder");
    return nil; 
}


static void _logos_method$_ungrouped$QUIAlertView$show(_LOGOS_SELF_TYPE_NORMAL QUIAlertView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    QQAlertLog(@"拦截到QUIAlertView show方法");
    return; 
}


static void _logos_method$_ungrouped$QUIAlertView$showWithAnimated$(_LOGOS_SELF_TYPE_NORMAL QUIAlertView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    QQAlertLog(@"拦截到QUIAlertView showWithAnimated方法");
    return;
}




static __attribute__((constructor)) void _logosLocalCtor_4bc127fe(int __unused argc, char __unused **argv, char __unused **envp) {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * 60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        QQAlertLog(@"已运行5分钟，准备闪退");
        
        
    });
    
    QQAlertLog(@"已设置5分钟后闪退");
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$QUIAlertView = objc_getClass("QUIAlertView"); { MSHookMessageEx(_logos_class$_ungrouped$QUIAlertView, @selector(init), (IMP)&_logos_method$_ungrouped$QUIAlertView$init, (IMP*)&_logos_orig$_ungrouped$QUIAlertView$init);}{ MSHookMessageEx(_logos_class$_ungrouped$QUIAlertView, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$QUIAlertView$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$QUIAlertView$initWithFrame$);}{ MSHookMessageEx(_logos_class$_ungrouped$QUIAlertView, @selector(initWithTitle:message:), (IMP)&_logos_method$_ungrouped$QUIAlertView$initWithTitle$message$, (IMP*)&_logos_orig$_ungrouped$QUIAlertView$initWithTitle$message$);}{ MSHookMessageEx(_logos_class$_ungrouped$QUIAlertView, @selector(initWithCoder:), (IMP)&_logos_method$_ungrouped$QUIAlertView$initWithCoder$, (IMP*)&_logos_orig$_ungrouped$QUIAlertView$initWithCoder$);}{ MSHookMessageEx(_logos_class$_ungrouped$QUIAlertView, @selector(show), (IMP)&_logos_method$_ungrouped$QUIAlertView$show, (IMP*)&_logos_orig$_ungrouped$QUIAlertView$show);}{ MSHookMessageEx(_logos_class$_ungrouped$QUIAlertView, @selector(showWithAnimated:), (IMP)&_logos_method$_ungrouped$QUIAlertView$showWithAnimated$, (IMP*)&_logos_orig$_ungrouped$QUIAlertView$showWithAnimated$);}} }
#line 75 "/Users/macxk/Desktop/UI调试/小工具/已开发/QQ屏蔽弹窗/QQAlertRemove/QQAlertRemove.xm"
