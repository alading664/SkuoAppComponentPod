//
//  PullDisplayFilterMenuView.h
//  happyvalley
//
//  Created by maojun on 2017/5/25.
//  Copyright © 2017年 Skuo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PullDisplayFilterMenuView;

@protocol PullDisplayFilterMenuDelegate <NSObject>

- (void)filterMenu:(PullDisplayFilterMenuView *)filterMenuView DidSelectMenu:(NSInteger)index;
- (void)filterMenu:(PullDisplayFilterMenuView *)filterMenuView DidSelectSubMenu:(NSInteger)index;

@end


@interface PullDisplayFilterMenuView : UIView

@property (nonatomic, weak) id<PullDisplayFilterMenuDelegate> delegate;
@property (nonatomic, strong) NSArray *menuDataArray;
@property (nonatomic, strong) NSArray *menuSubDataArray;
@property (nonatomic, strong) UIColor *leftMenuSelectColor;
@property (nonatomic, strong) UIFont *leftMenuNameFont;
@property (nonatomic, strong) UIFont *rightContentFont;

@end
