//
//  SELF_TabBarDefine.h
//  WS_Examples
//
//  Created by 王爽 on 18/7/18.
//  Copyright © 2016年 wangshuang. All rights reserved.
//

#ifndef SELF_TabBarDefine_h
#define SELF_TabBarDefine_h
// weak
#define WeakSelf __weak typeof(self)weakSelf = self

#define SELF_TabBarRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define SELF_TabBarRGB(r,g,b) SELF_TabBarRGBA(r,g,b,1.0f)

#define SELF_TabBarItemSlectBlue SELF_TabBarRGB(59,185,222)
#define SELF_TabBarItemBadgeRed  SELF_TabBarRGB(255,38,0)

#define SELF_IsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//iPhoneX以下49，以上83
//    self.selfTabBar.frame = self.tabBar.bounds;

#endif
