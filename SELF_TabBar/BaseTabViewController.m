//
//  BaseTabViewController.m
//  WS_Fusion
//
//  Created by 王爽 on 2022/10/2.
//

#import "BaseTabViewController.h"

#define RGB(r,g,b,d) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:d]

@interface BaseTabViewController ()<SELF_TabBarDelegate>

@end

@implementation BaseTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarConfs = @[].mutableCopy;
    self.tabBarVCs = @[].mutableCopy;
}

/// setUpTabBarConfigModelNormalImg子类重写这个方法进行自定义设置
/// 以下为配置示例
- (void)setUpTabBarConfigModelNormalImg:(NSString *)normalImg selectImg:(NSString*)selectImg itemTitle:(NSString *)itemTitle selectTingColor:(UIColor *)selectTingColor andVC:(UIViewController *)vc{
    /*
    // 2.根据集合来创建TabBar构造器
    SELF_TabBarConfigModel *model = [SELF_TabBarConfigModel new];
    model.itemLayoutStyle = SELF_TabBarItemLayoutStyleTopPictureBottomTitle;
    model.titleLabel.font = [UIFont systemFontOfSize:14];
    // 3.item基础数据三连
    model.itemTitle = itemTitle;
    model.normalImageName = normalImg;
    model.selectImageName = selectImg;
    //4 设置单个选中item标题状态下的颜色
    //model.selectColor = [UIColor orangeColor];
    //model.normalColor = [UIColor whiteColor];
    //model.normalTintColor = [UIColor whiteColor];
    //model.selectBackgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    //model.interactionEffectStyle = AxcAE_TabBarInteractionEffectStyleShake;
    //4 DEMO 设置选中的背景颜色
    model.normalTintColor = RGB(145,145,145,1);
    model.selectTintColor = selectTingColor;
    // 标题选中文字色和图片统一
    //model.selectColor = selectTingColor;

    NSInteger idx = 2;
    switch (idx) {
        case 0:
            model.itemSize = CGSizeMake(70, 40);
            break;
        case 2:
            model.itemSize = CGSizeMake(70, 40);
            model.itemBadgeStyle = SELF_TabBarItemBadgeStyleTopRight;
            model.badge = [NSString stringWithFormat:@"%d",arc4random()%100 + 50];
            break;
        case 3:
            model.itemSize = CGSizeMake(70, 40);
            model.itemBadgeStyle = SELF_TabBarItemBadgeStyleTopLeft;
            model.badge = [NSString stringWithFormat:@"%d",arc4random()%100 + 50];
            break;
        case 4:
            model.itemLayoutStyle = SELF_TabBarItemLayoutStyleLeftPictureRightTitle;
            break;
        default: break;
    }
    ///  设置动画模式
    NSArray *customAnimationArray = @[@(SELF_TabBarInteractionEffectStyleSpring), // 放大放小弹簧效果
                                  @(SELF_TabBarInteractionEffectStyleShake),      // 摇动动画效果
                                  @(SELF_TabBarInteractionEffectStyleAlpha),      // 透明动画效果
                                  @(SELF_TabBarInteractionEffectStyleCustom),     // 自定义动画效果 4
                                  @(SELF_TabBarInteractionEffectStyleCustom)];    // 自定义动画效果 5
    model.interactionEffectStyle = [customAnimationArray[idx] integerValue];
    model.tag = 100 + idx;
    // 自定义动画回调Block
    model.customInteractionEffectBlock = ^(SELF_TabBarItem *item) {
        if (item.itemModel.tag - 100 == 3) { // 第四个
            NSLog(@"触发第四个Item的自定义动画");
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
            animation.duration = 1;
            animation.calculationMode = kCAAnimationCubic;
            [item.layer addAnimation:animation forKey:nil];
        }else if (item.itemModel.tag - 100 == 4){ // 第五个
            NSLog(@"触发第五个Item的自定义动画");
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
            CGFloat angle = M_PI_4 / 10;
            animation.values = @[@(-angle), @(angle), @(-angle)];
            animation.duration = 1;
            [item.layer addAnimation:animation forKey:nil];
        }else{}
    };
    // item在normal下的背景色
     model.normalBackgroundColor = [UIColor lightGrayColor];

    
    // 5.将VC添加到系统控制组
    [_tabBarVCs addObject:vc];
    // 5.1添加构造Model到集合
    [_tabBarConfs addObject:model];
    // 设置VCs -----
    // 一定要先设置这一步，然后再进行后边的顺序，因为系统只有在setViewControllers函数后才不会再次创建UIBarButtonItem，以免造成遮挡
    // 大意就是一定要让自定义TabBar遮挡住系统的TabBar
    self.viewControllers = _tabBarVCs;
     */
}
/// 需要再setUpTabBarConfigModelNormalImg方法添加所有VC后,再调用setupTabbar
- (void)setupTabbar{
    // 6.2 创建selfTabBar,selfTabBar不可以懒加载
    self.selfTabBar = [SELF_TabBar new] ;
    self.selfTabBar.tabBarConfig = _tabBarConfs;
    // 7.设置委托
    self.selfTabBar.delegate = self;
    // 8.添加覆盖到上边
    [self.tabBar addSubview:self.selfTabBar];
    [self addLayoutTabBar]; // 10.添加适配
    //shuang 默认颜色
    self.selfTabBar.backgroundColor = RGB(24,24,24,1);
}
// 子类重写这个方法
- (void)SELF_TabBar:(SELF_TabBar *)tabbar selectIndex:(NSInteger)index{
    /*
    // 通知 切换视图控制器
    [self setSelectedIndex:index];
    // 自定义的TabBar回调点击事件给TabBarVC，TabBarVC用父类的TabBarController函数完成切换
    */
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    if(self.selfTabBar){
        self.selfTabBar.selectIndex = selectedIndex;
    }
}

// 10.添加适配
- (void)addLayoutTabBar{
    // 使用重载viewDidLayoutSubviews实时计算坐标 （下边的 -viewDidLayoutSubviews 函数）
    // 能兼容转屏时的自动布局
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.selfTabBar.frame = self.tabBar.bounds;
    [self.selfTabBar viewDidLayoutItems];
}


@end
