//
//  PullDisplayFilterMenuView.m
//  happyvalley
//
//  Created by maojun on 2017/5/25.
//  Copyright © 2017年 Skuo. All rights reserved.
//

#import "PullDisplayFilterMenuView.h"
#import "Masonry.h"
#import "NSArray+YUZ.h"
#import "SkuoAppComponentPodDefine.h"
#import "LeftMenuTableViewCell.h"
#import "RightContentTableViewCell.h"

@interface PullDisplayFilterMenuView () <UITableViewDataSource, UITableViewDelegate>{
    UITableView *_leftMenuTable;
    UITableView *_rightContentTable;
//    CurrentUser *_usr;
}

@end

@implementation PullDisplayFilterMenuView

- (instancetype)initWithFrame:(CGRect)frame {	
    self = [super initWithFrame:frame];
    if (self) {
//        _usr = happyvalleyUser;
        [self drawViewComonentUI];
    }
    return self;
}


- (void)drawViewComonentUI {
    _leftMenuTable = [UITableView new];
    [self addSubview:_leftMenuTable];
    [_leftMenuTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self);
        make.width.mas_equalTo(80*kFitWidth);
        make.height.mas_equalTo(self);
    }];
    _leftMenuTable.backgroundColor=kAppBlckgroundColor;
    _leftMenuTable.showsVerticalScrollIndicator = NO;
    _leftMenuTable.showsHorizontalScrollIndicator = NO;
    _leftMenuTable.dataSource = self;
    _leftMenuTable.delegate = self;
    _leftMenuTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_leftMenuTable registerClass:[LeftMenuTableViewCell class] forCellReuseIdentifier:NSStringFromClass([LeftMenuTableViewCell class])];
    
    _rightContentTable = [UITableView new];
    [self addSubview:_rightContentTable];
    [_rightContentTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80*kFitWidth);
        make.height.top.right.mas_equalTo(self);
    }];
    _rightContentTable.backgroundColor=[UIColor whiteColor];
    _rightContentTable.showsVerticalScrollIndicator = NO;
    _rightContentTable.showsHorizontalScrollIndicator = NO;
    _rightContentTable.dataSource = self;
    _rightContentTable.delegate = self;
    _rightContentTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_rightContentTable registerClass:[RightContentTableViewCell class] forCellReuseIdentifier:NSStringFromClass([RightContentTableViewCell class])];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _leftMenuTable) {
        return _menuDataArray.count;
    }
    else {
        return _menuSubDataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftMenuTable) {
        LeftMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LeftMenuTableViewCell class]) forIndexPath:indexPath];
        cell.nameStr = [_menuDataArray YUZ_AtIndex:indexPath.row];
        cell.leftSelectColor = self.leftMenuSelectColor;
        cell.nameTitleFont = self.leftMenuNameFont;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenWidth);
        return cell;
    }
    else {
        RightContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RightContentTableViewCell class]) forIndexPath:indexPath];
        cell.contentFont = self.rightContentFont;
        cell.contentStr = [_menuSubDataArray YUZ_AtIndex:indexPath.row];
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenWidth);
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftMenuTable) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(filterMenu:DidSelectMenu:)]) {
            [self.delegate filterMenu:self DidSelectMenu:indexPath.row];
        }
    }
    else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(filterMenu:DidSelectSubMenu:)]) {
            [self.delegate filterMenu:self DidSelectSubMenu:indexPath.row];
        }
    }
}


- (void)setMenuDataArray:(NSArray *)menuDataArray {
    _menuDataArray = menuDataArray;
    [_leftMenuTable reloadData];
    if (_menuDataArray.count > 0) {
        [_leftMenuTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        if (self.delegate && [self.delegate respondsToSelector:@selector(filterMenu:DidSelectMenu:)]) {
            [self.delegate filterMenu:self DidSelectMenu:1];
        }
    }
}

- (void)setMenuSubDataArray:(NSArray *)menuSubDataArray {
    _menuSubDataArray = menuSubDataArray;
    [_rightContentTable reloadData];
}

- (UIFont *)leftMenuNameFont {
    if (_leftMenuNameFont == nil) {
        _leftMenuNameFont = [UIFont boldSystemFontOfSize:15];
    }
    return _leftMenuNameFont;
}

- (UIColor *)leftMenuSelectColor {
    if (_leftMenuSelectColor == nil) {
        _leftMenuSelectColor = [UIColor blueColor];
    }
    return _leftMenuSelectColor;
}

- (UIFont *)rightContentFont {
    if (_rightContentFont == nil) {
        _rightContentFont = [UIFont boldSystemFontOfSize:15];
    }
    return _rightContentFont;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
@end
