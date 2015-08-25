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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier boolImage:(BOOL) boolimage
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        int iheight=0;
        // Initialization code
        self.icronImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, iheight+8, 30, 30)];
        iheight+=8;
        [self addSubview:self.icronImage];
        
        self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(52, iheight, 40, 15)];
        self.nameLabel.font = [UIFont italicSystemFontOfSize:15];
        self.nameLabel.textColor=[UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:139.0f/255.0f alpha:0.5];
        iheight+=20;
        [self addSubview:self.nameLabel];
        
        self.contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(52, iheight, 160, 15)];
        self.contentLabel.font = [UIFont italicSystemFontOfSize:15];
        iheight+=17;
        [self addSubview:self.contentLabel];
        
        if (boolimage==YES) {
            self.contentImage=[[UIImageView alloc]initWithFrame:CGRectMake(52, iheight, 160, 160)];
            iheight+=165;
            [self addSubview:self.contentImage];
        }
        
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(52, iheight, 60, 10)];
        self.timeLabel.font = [UIFont italicSystemFontOfSize:10];
        [self addSubview:self.timeLabel];
        
        self.commentImage=[[UIImageView alloc]initWithFrame:CGRectMake(325, iheight, 20, 12)];
        iheight+=15;
        [self addSubview:self.commentImage];
        
        self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(52, iheight, 290, 20)];
        self.commentLabel.backgroundColor=[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
        self.commentLabel.font = [UIFont italicSystemFontOfSize:15];
        iheight+=24;
        [self addSubview:self.commentLabel];

        self.separator = [[UIView alloc] initWithFrame:CGRectMake(0, iheight, 380, 1)];
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
