//
//  PullDisplayFilterMenuViewController.m
//  happyvalley
//
//  Created by maojun on 2017/5/25.
//  Copyright © 2017年 Skuo. All rights reserved.
//

#import "PullDisplayFilterMenuViewController.h"
#import "LeftMenuTableViewCell.h"
#import "RightContentTableViewCell.h"

@interface PullDisplayFilterMenuViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_leftMenuTable;
    UITableView *_rightContentTable;
    CurrentUser *_usr;
}

@end

@implementation PullDisplayFilterMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _usr = happyvalleyUser;
    [self drawViewComonentUI];
    // Do any additional setup after loading the view.
}

- (void)drawViewComonentUI {
    _leftMenuTable = [UITableView new];
    [self.view addSubview:_leftMenuTable];
    [_leftMenuTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.view);
        make.width.mas_equalTo(80*kFitWidth);
        make.height.mas_equalTo(self.view);
    }];
    _leftMenuTable.backgroundColor=kAppBlckgroundColor;
    _leftMenuTable.showsVerticalScrollIndicator = NO;
    _leftMenuTable.showsHorizontalScrollIndicator = NO;
    _leftMenuTable.dataSource = self;
    _leftMenuTable.delegate = self;
    _leftMenuTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_leftMenuTable registerClass:[LeftMenuTableViewCell class] forCellReuseIdentifier:NSStringFromClass([LeftMenuTableViewCell class])];
//        _leftMenuTable.separatorColor= [UIColor colorWithRed:52.0f/255.0f green:53.0f/255.0f blue:61.0f/255.0f alpha:1];
//    if ([_leftMenuTable respondsToSelector:@selector(setLayoutMargins:)]) {
//        _leftMenuTable.layoutMargins=UIEdgeInsetsZero;
//    }
//    if ([_leftMenuTable respondsToSelector:@selector(setSeparatorInset:)]) {
//        _leftMenuTable.separatorInset=UIEdgeInsetsZero;
//    }
    
    
    _rightContentTable = [UITableView new];
    [self.view addSubview:_rightContentTable];
    [_rightContentTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80*kFitWidth);
        make.height.top.right.mas_equalTo(self.view);
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
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftMenuTable) {
        LeftMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LeftMenuTableViewCell class]) forIndexPath:indexPath];
        cell.nameStr = [_menuDataArray YUZ_AtIndex:indexPath.row];
        cell.leftSelectColor = self.leftMenuSelectColor;
        cell.nameTitleFont = self.leftMenuNameFont;
        return cell;
    }
    else {
        RightContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RightContentTableViewCell class]) forIndexPath:indexPath];
        cell.contentFont = self.rightContentFont;
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
