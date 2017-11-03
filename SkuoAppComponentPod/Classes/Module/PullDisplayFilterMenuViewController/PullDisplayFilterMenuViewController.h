//
//  PullDisplayFilterMenuViewController.h
//  happyvalley
//
//  Created by maojun on 2017/5/25.
//  Copyright © 2017年 Skuo. All rights reserved.
//
#import <UIKit/UIKit.h>

@class PullDisplayFilterMenuViewController;

//@protocol PullDisplayFilterMenuViewDataSource <NSObject>
//
//- (NSArray *)ArrayOfFilterMenu:(PullDisplayFilterMenuViewController *)filterMenuView;
//
//@end
//
//
//@protocol PullDisplayFilterMenuViewDelegate <NSObject>
//
//- (void)filterMenu:(PullDisplayFilterMenuViewController *)filterMenuView DidSelectMenu:(NSInteger)index;
//
//@end


@interface PullDisplayFilterMenuViewController : UIViewController

@property (nonatomic, strong) NSArray *menuDataArray;
@property (nonatomic, strong) UIColor *leftMenuSelectColor;
@property (nonatomic, strong) UIFont *leftMenuNameFont;
@property (nonatomic, strong) UIFont *rightContentFont;


@end
