//
//  SELF_TabBarBadge.h
//  WS_Examples
//
//  Created by 王爽 on 18/7/18.
//  Copyright © 2016年 wangshuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SELF_TabBarDefine.h"

@interface SELF_TabBarBadge : UILabel
// 文字或者数字
@property (nonatomic, strong) NSString *badgeText;
// 为零是否自动隐藏 默认不隐藏
@property(nonatomic, assign)BOOL automaticHidden;
// 气泡高度，默认15
@property(nonatomic, assign)CGFloat badgeHeight;
// 气泡宽度，默认0 设置宽度后由你来决定要多宽
@property(nonatomic , assign)CGFloat badgeWidth;

@end
