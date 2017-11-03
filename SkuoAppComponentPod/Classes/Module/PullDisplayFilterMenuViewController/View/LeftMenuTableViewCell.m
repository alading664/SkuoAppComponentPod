//
//  LeftMenuTableViewCell.m
//  happyvalley
//
//  Created by maojun on 2017/5/25.
//  Copyright © 2017年 Skuo. All rights reserved.
//

#import "LeftMenuTableViewCell.h"
@interface LeftMenuTableViewCell () {
    UIView *_leftColorView;
    UILabel *_nameLabel;
}

@end

@implementation LeftMenuTableViewCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = kAppBlckgroundColor;
        [self drawCellUI];
    }
    return self;
}

- (void)drawCellUI {
    _leftColorView = [UIView new];
    [self.contentView addSubview:_leftColorView];
    [_leftColorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self.contentView);
        make.width.mas_equalTo(3);
    }];

    
    _nameLabel = [UILabel new];
    [self.contentView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.contentView);
        make.height.mas_equalTo(20*kFitHeight);
    }];
    [_nameLabel sizeToFit];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [_nameLabel setTextColor:HAPPYVALLEY_COLOR_SUBTITLE];
}


- (void)setNameTitleFont:(UIFont *)nameTitleFont {
    _nameTitleFont = nameTitleFont;
    _nameLabel.font = _nameTitleFont;
}

- (void)setLeftSelectColor:(UIColor *)leftSelectColor {
    _leftSelectColor = leftSelectColor;
    _leftColorView.backgroundColor = _leftSelectColor;
}

- (void)setNameStr:(NSString *)nameStr {
    _nameStr = nameStr;
    _nameLabel.text = _nameStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        _leftColorView.hidden = NO;
        _leftColorView.backgroundColor = _leftSelectColor;
        self.contentView.backgroundColor = [UIColor whiteColor];
        if (_leftSelectColor) {
            [_nameLabel setTextColor:_leftSelectColor];
        }
    }
    else {
        self.contentView.backgroundColor = kAppBlckgroundColor;
        [_nameLabel setTextColor:HAPPYVALLEY_COLOR_SUBTITLE];
        _leftColorView.hidden = YES;
    }
    // Configure the view for the selected state
}

@end
