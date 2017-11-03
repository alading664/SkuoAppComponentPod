//
//  StarCommitRatingView.m
//  happyvalley
//
//  Created by maojun on 2017/6/30.
//  Copyright © 2017年 Skuo. All rights reserved.
//

#import "StarCommitRatingView.h"
@interface StarCommitRatingView () {
    NSArray *_starArray;
    UIButton *_btn1;
    UIButton *_btn2;
    UIButton *_btn3;
    UIButton *_btn4;
    UIButton *_btn5;
}

@end

@implementation StarCommitRatingView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self drawCellUI];
    }
    return self;
}

- (void)layoutSubviews {
    [self layoutCellUI];
}

- (void)drawCellUI {
    _btn1 = [UIButton new];
    _btn1.tag = 1;
    [self addSubview:_btn1];
    [_btn1 addTarget:self action:@selector(starAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _btn2 = [UIButton new];
    _btn2.tag = 2;
    [self addSubview:_btn2];
    [_btn2 addTarget:self action:@selector(starAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _btn3 = [UIButton new];
    _btn3.tag = 3;
    [self addSubview:_btn3];
    [_btn3 addTarget:self action:@selector(starAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _btn4 = [UIButton new];
    _btn4.tag = 4;
    [self addSubview:_btn4];
    [_btn4 addTarget:self action:@selector(starAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _btn5 = [UIButton new];
    _btn5.tag = 5;
    [self addSubview:_btn5];
    [_btn5 addTarget:self action:@selector(starAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _starArray = @[_btn1, _btn2, _btn3, _btn4, _btn5];
    
    self.score = 3;
}

- (void)layoutCellUI {
    
    float btn_width = self.bounds.size.width/5;
    
    [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self.mas_left).offset(btn_width);
    }];
   
    [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).offset(btn_width);
        make.right.mas_equalTo(self.mas_left).offset(2*btn_width);
    }];
    
    [_btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).offset(2*btn_width);
        make.right.mas_equalTo(self.mas_left).offset(3*btn_width);
    }];
    
    [_btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).offset(3*btn_width);
        make.right.mas_equalTo(self.mas_left).offset(4*btn_width);
    }];
    
    [_btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self.mas_left).offset(4*btn_width);
        make.right.mas_equalTo(self.mas_left).offset(5*btn_width);
    }];
}

- (void)starAction:(UIButton *)btn {
    if (_isIndicate) {
        return;
    }
    NSInteger index = btn.tag;
    
    for(UIButton *btn in _starArray) {
        btn.selected = NO;
    }
    
    _score = index;
    for (int i=0; i<index; i++) {
        UIButton *btn = [_starArray YUZ_AtIndex:i];
        btn.selected = YES;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(StarCommitRatingView:withScore:)]) {
        [self.delegate StarCommitRatingView:self withScore:_score];
    }
    
}

- (void)setScore:(NSInteger)score {
    if (score > 5) {
        _score = 5;
    }
    else if (score < 0) {
        _score = 0;
    }
    else {
        _score = score;
    }
    for (int i=0; i<_score; i++) {
        UIButton *btn = [_starArray YUZ_AtIndex:i];
        btn.selected = YES;
    }
}

- (void)setSelectImage:(UIImage *)selectImage {
    for (UIButton *btn in _starArray) {
        [btn setImage:selectImage forState:UIControlStateSelected];
    }
}

- (void)setNormalImage:(UIImage *)normalImage {
    for (UIButton *btn in _starArray) {
        [btn setImage:normalImage forState:UIControlStateNormal];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
