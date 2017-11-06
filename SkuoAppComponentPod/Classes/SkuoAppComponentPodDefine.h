//
//  SkuoAppComponentPodDefine.h
//  Pods
//
//  Created by maojun on 2017/11/3.
//

#ifndef SkuoAppComponentPodDefine_h
#define SkuoAppComponentPodDefine_h


/*! 当前设备屏幕 宽/高 */
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

/*! 屏幕比率 以iPhone 6 Plus为基准 */
#define kFitWidth  ([UIScreen mainScreen].bounds.size.width / 414)
#define kFitHeight ([UIScreen mainScreen].bounds.size.height / 736)

/*! Masonry相关比率 以iPhone 6 Plus为基准 */
#define kFitLeft   ([UIScreen mainScreen].bounds.size.width / 414)
#define kFitRight  ([UIScreen mainScreen].bounds.size.width / 414)
#define kFitTop    ([UIScreen mainScreen].bounds.size.height / 736)
#define kFitBottom ([UIScreen mainScreen].bounds.size.height / 736)

/*! 根据屏幕高度判断真机设备 */
#define iPhone4s    ([[UIScreen mainScreen] bounds].size.height == 480)
#define iPhone5     ([[UIScreen mainScreen] bounds].size.height == 568)
#define iPhone6     ([[UIScreen mainScreen] bounds].size.height == 667)
#define iPhone6Plus ([[UIScreen mainScreen] bounds].size.height == 736)

#define HAPPYVALLEY_COLOR_SUBTITLE [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1.0]
#define kAppBlckgroundColor [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0]

#endif /* SkuoAppComponentPodDefine_h */
