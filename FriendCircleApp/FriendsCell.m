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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier FriendsInfo:(FriendsInfo*)friendsinfo
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _iheight=0;
        // Initialization code
        self.icronImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, _iheight+8, WIDTH, HEIGHT)];
        self.icronImage.image=[self loadImage:friendsinfo.icron];
        _iheight+=8;
        [self addSubview:self.icronImage];
        
        self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(52, _iheight, WIDTH+10, HEIGHT-15)];
        self.nameLabel.font = [UIFont italicSystemFontOfSize:15];
        self.nameLabel.textColor=[UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:139.0f/255.0f alpha:0.5];
        self.nameLabel.text=friendsinfo.name;
        _iheight+=20;
        [self addSubview:self.nameLabel];
        
        self.contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(52, _iheight, WIDTH+130, HEIGHT-15)];
        self.contentLabel.font = [UIFont italicSystemFontOfSize:15];
        self.contentLabel.text=friendsinfo.content;
        _iheight+=17;
        [self addSubview:self.contentLabel];
        
        if (friendsinfo.imagecontent!=nil) {
            self.contentImage=[[UIImageView alloc]initWithFrame:CGRectMake(52, _iheight, WIDTH+130, HEIGHT+130)];
            self.contentImage.image=[self loadImage:friendsinfo.imagecontent];
            _iheight+=165;
            [self addSubview:self.contentImage];
        }
        
        
        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(52, _iheight, WIDTH+30, HEIGHT-10)];
        self.timeLabel.font = [UIFont italicSystemFontOfSize:10];
        self.timeLabel.text=friendsinfo.time;
        [self addSubview:self.timeLabel];
        
        self.commentImage=[[UIImageView alloc]initWithFrame:CGRectMake(325, _iheight, WIDTH-10, HEIGHT-18)];
        self.commentImage.image=[self loadImage:@"commentimage"];
        _iheight+=20;
        [self addSubview:self.commentImage];
        
        self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(52, _iheight, WIDTH+260, HEIGHT-10)];
        self.commentLabel.backgroundColor=[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
        self.commentLabel.font = [UIFont italicSystemFontOfSize:15];
        self.commentLabel.text=friendsinfo.comments;
        _iheight+=24;
        [self addSubview:self.commentLabel];

        self.separator = [[UIView alloc] initWithFrame:CGRectMake(0, _iheight, 380, 1)];
        self.separator.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
        [self addSubview:self.separator];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
       
    }
    return self;
}

-(NSInteger)calculateHeight:(BOOL) boolimage
{
    _iheight=28;
    if(1)
    {
        //contentLabel;
        _iheight+=17;
    }
    
    if (boolimage==YES) {
        _iheight+=165;
    }
    
    if (1) {
        //timelabel
         _iheight+=20;
    }

    if (1) {
        //comment
        _iheight+=15;
    }
    
    _iheight+=10;
    
    return _iheight;
}

-(UIImage*)loadImage:(NSString*)pathResource
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:pathResource ofType:@"png"];
    NSData *image = [NSData dataWithContentsOfFile:filePath];
    return [UIImage imageWithData:image];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
