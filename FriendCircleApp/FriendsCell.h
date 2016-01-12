//
//  FriendsCell.h
//  FriendCircleApp
//
//  Created by TWer  on 8/23/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendsInfo.h"
#import "GoodLabel.h"
#import <POP.h>
#define WIDTH 30
#define HEIGHT 30
#define FONTSIZESMALL 14
#define FONTSIZELARGE 15
@interface FriendsCell : UITableViewCell

@property UILabel *timeLabel;

@property UILabel *commentLabel;
@property UILabel *contentLabel;
@property UIImageView *icronImage;
@property UIImageView *contentImage;
@property UILabel *goodlabel;
@property UIButton *commentImagebtn;
@property UILabel *nameLabel;
@property UIView * separator;

@property UIButton *goodbtn;

@property NSInteger iheight;

@property NSInteger indexgood;
@property UITableView* tableview;
-(id)initWithStyle:(UITableViewCellStyle)style  FriendsInfo:(FriendsInfo*)friendsinfo Tableview:(UITableView*) friendsTableView Index:(NSInteger) index;
-(NSInteger)calculateHeight:(FriendsInfo*)friendsinfo Index:(NSInteger) index;

@end
