//
//  FriendsCell.m
//  FriendCircleApp
//
//  Created by TWer  on 8/23/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "FriendsCell.h"

@implementation FriendsCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.icronImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, 8, 30, 30)];
        [self addSubview:self.icronImage];
        
        self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(52, 8, 40, 15)];
        self.nameLabel.font = [UIFont italicSystemFontOfSize:15];
        self.nameLabel.textColor=[UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:139.0f/255.0f alpha:0.5];;
        [self addSubview:self.nameLabel];
        
        self.contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(52, 28, 160, 15)];
        self.contentLabel.font = [UIFont italicSystemFontOfSize:15];
        [self addSubview:self.contentLabel];
        
        self.contentImage=[[UIImageView alloc]initWithFrame:CGRectMake(52, 45, 160, 160)];
         [self addSubview:self.contentImage];
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(52, 210, 60, 10)];
        self.timeLabel.font = [UIFont italicSystemFontOfSize:10];
        [self addSubview:self.timeLabel];
        
        self.commentImage=[[UIImageView alloc]initWithFrame:CGRectMake(325, 210, 20, 12)];
        [self addSubview:self.commentImage];
        
        self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(52, 225, 290, 20)];
        self.commentLabel.backgroundColor=[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
        self.commentLabel.font = [UIFont italicSystemFontOfSize:15];
        [self addSubview:self.commentLabel];

        self.separator = [[UIView alloc] initWithFrame:CGRectMake(0, 249, 380, 1)];
        self.separator.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
        [self addSubview:self.separator];
            
            
       
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
