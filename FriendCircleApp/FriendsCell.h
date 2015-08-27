//
//  FriendsCell.h
//  FriendCircleApp
//
//  Created by TWer  on 8/23/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendsInfo.h"
#define WIDTH 30
#define HEIGHT 30

@interface FriendsCell : UITableViewCell
@property UILabel *timeLabel;

@property UILabel *commentLabel;
@property UILabel *contentLabel;
@property UIImageView *icronImage;
@property UIImageView *contentImage;
@property UIImageView *commentImage;
@property UILabel *nameLabel;
@property UIView * separator;

@property NSInteger iheight;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier FriendsInfo:(FriendsInfo*)friendsinfo;
-(NSInteger)calculateHeight:(FriendsInfo*)friendsinfo;

@end
