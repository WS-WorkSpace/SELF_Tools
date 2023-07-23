//
//  BaseTabViewController.h
//  WS_Fusion
//
//  Created by 王爽 on 2022/10/2.
//

#import <UIKit/UIKit.h>
#import "SELF_TabBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabViewController : UITabBarController

@property (nonatomic, strong)SELF_TabBar *selfTabBar;

@property (nonatomic, strong)NSMutableArray<SELF_TabBarConfigModel *> *tabBarConfs;

@property (nonatomic, strong)NSMutableArray *tabBarVCs;


/// 子类继承BaseTabViewController,进行初始化方法
/// - Parameters:
///   - normalImg: normal图片
///   - selectImg: 选中后图片
///   - itemTitle: item标题
///   - selectTingColor: 选中的itemBar的字体颜色
///   - vc: NavigationController / ViewController
- (void)setUpTabBarConfigModelNormalImg:(NSString *)normalImg selectImg:(NSString*)selectImg itemTitle:(NSString *)itemTitle selectTingColor:(UIColor *)selectTingColor andVC:(UIViewController *)vc;
- (void)setupTabbar;

@end

NS_ASSUME_NONNULL_END
