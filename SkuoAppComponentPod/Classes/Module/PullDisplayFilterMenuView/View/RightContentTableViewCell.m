//
//  RightContentTableViewCell.m
//  happyvalley
//
//  Created by maojun on 2017/5/25.
//  Copyright © 2017年 Skuo. All rights reserved.
//

#import "RightContentTableViewCell.h"
#import "SkuoAppComponentPodDefine.h"
#import "Masonry.h"

@interface RightContentTableViewCell () {
    UILabel *_contentLabel;
}

@end

@implementation RightContentTableViewCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self drawCellUI];
    }
    return self;
}

- (void)drawCellUI {
    _contentLabel = [UILabel new];
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60*kFitLeft);
        make.centerY.mas_equalTo(self.contentView);
        make.height.mas_equalTo(20*kFitHeight);
    }];
    _contentLabel.adjustsFontSizeToFitWidth = YES;
    [_contentLabel setTextColor:HAPPYVALLEY_COLOR_SUBTITLE];
}

- (void)setContentStr:(NSString *)contentStr {
    _contentStr = contentStr;
    _contentLabel.text = _contentStr;
}

- (void)setContentFont:(UIFont *)contentFont {
    _contentFont = contentFont;
    _contentLabel.font = _contentFont;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
