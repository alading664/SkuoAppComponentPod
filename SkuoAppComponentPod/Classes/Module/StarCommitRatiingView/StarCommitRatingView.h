//
//  StarCommitRatingView.h
//  happyvalley
//
//  Created by maojun on 2017/6/30.
//  Copyright © 2017年 Skuo. All rights reserved.
//

//#define kStarNum 5
@class StarCommitRatingView;

#import <UIKit/UIKit.h>


@protocol StarCommitRatingDelegate <NSObject>

- (void)StarCommitRatingView:(StarCommitRatingView *)myView withScore:(NSInteger)score;

@end


@interface StarCommitRatingView : UIView

@property (nonatomic, unsafe_unretained) bool isIndicate;
@property (nonatomic, strong) UIImage *selectImage;
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, unsafe_unretained) NSInteger score;
@property (nonatomic, weak) id<StarCommitRatingDelegate> delegate;


@end
