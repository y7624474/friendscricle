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
        _iheight=8;
        // Initialization code
        self.icronImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, _iheight, WIDTH, HEIGHT)];
        self.icronImage.image=[self loadImage:friendsinfo.icron];
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
        
        NSInteger commentlabelheight=5;
        for (int i=0; i<[[self describeDictionary:[friendsinfo.comments mutableCopy]][1] intValue]; i++) {
            commentlabelheight+=15;
        }
        
        self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(52, _iheight, WIDTH+260, commentlabelheight)];
        self.commentLabel.backgroundColor=[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
        self.commentLabel.font = [UIFont italicSystemFontOfSize:15];
        self.commentLabel.numberOfLines=0;
        self.commentLabel.text=[self describeDictionary:[friendsinfo.comments mutableCopy]][0];
        for (int i=0; i<[[self describeDictionary:[friendsinfo.comments mutableCopy]][1] intValue]; i++) {
            _iheight+=15;
        }
        _iheight+=9;
        [self addSubview:self.commentLabel];

        self.separator = [[UIView alloc] initWithFrame:CGRectMake(0, _iheight, 380, 1)];
        self.separator.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
        [self addSubview:self.separator];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
       
    }
    return self;
}

-(NSMutableArray*) describeDictionary:(NSMutableArray*) commentsarray
{
    NSDictionary* commentsdic;
    NSUInteger i, commentcount=0;

    commentcount = [commentsarray count];
    NSMutableArray* result=[NSMutableArray arrayWithCapacity:2];
    NSMutableString* strcomment = [NSMutableString new];
    for (i = 0; i < commentcount; i++)
    {
        commentsdic = [commentsarray objectAtIndex: i];
        NSArray* keys=[commentsdic allKeys];
        NSString* key=[keys objectAtIndex:0];
        [strcomment appendFormat:@"%@:%@ ", key, [commentsdic valueForKey:key]];

        if (i!=commentcount-1) {
            [strcomment appendString:@"\n"];
        }
    }
    [result addObject:strcomment];
    [result addObject:[NSString stringWithFormat:@"%lu",(unsigned long)commentcount]];
    
    return result;
}

-(NSInteger)calculateHeight:(FriendsInfo*)friendsinfo;

{
    _iheight=28;
    if(1)
    {
        //contentLabel;
        _iheight+=17;
    }
    
    if (friendsinfo.imagecontent!=nil) {
        _iheight+=165;
    }
    
    //time
    _iheight+=20;
    
    //comments
    for (int i=0; i<[[self describeDictionary:[friendsinfo.comments mutableCopy]][1] intValue]; i++) {
        _iheight+=15;
    }

    //separator
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
}

@end
