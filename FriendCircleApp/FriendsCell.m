//
//  FriendsCell.m
//  FriendCircleApp
//
//  Created by TWer  on 8/23/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "FriendsCell.h"


@implementation FriendsCell
GoodLabel *goodlable;
- (void)awakeFromNib {
    // Initialization code

}

- (id)initWithStyle:(UITableViewCellStyle)style  FriendsInfo:(FriendsInfo*)friendsinfo Tableview:(UITableView*) friendstableView Index:(NSInteger)index

{
    _indexgood=index;
    goodlable=[GoodLabel getInstance];
    self.tableview=friendstableView;
    self = [super initWithStyle:style reuseIdentifier:nil];
    if (self) {
        _iheight=8;
        // Initialization code
        self.icronImage=[[UIImageView alloc]initWithFrame:CGRectMake(15, _iheight, WIDTH, HEIGHT)];
        self.icronImage.image=[self loadImage:friendsinfo.icron];
        [self addSubview:self.icronImage];
        
        self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(52, _iheight, WIDTH+10, HEIGHT-15)];
        self.nameLabel.font = [UIFont italicSystemFontOfSize:FONTSIZELARGE];
        self.nameLabel.textColor=[UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:139.0f/255.0f alpha:0.5];
        self.nameLabel.text=friendsinfo.name;
        _iheight+=20;
        [self addSubview:self.nameLabel];
        
        
        NSUInteger contentheight=(([friendsinfo.content length])*FONTSIZESMALL)/160;
        
        self.contentLabel=[[UILabel alloc]initWithFrame:CGRectMake(52, _iheight, WIDTH+260, FONTSIZESMALL+10*contentheight)];
        self.contentLabel.font = [UIFont italicSystemFontOfSize:FONTSIZESMALL];
        self.contentLabel.numberOfLines=0;
        self.contentLabel.text=friendsinfo.content;
        _iheight+=10*contentheight;
        _iheight+=15;
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
        


        self.commentImagebtn=[[UIButton alloc]initWithFrame:CGRectMake(325, _iheight, WIDTH-10, HEIGHT-18)];
        [self.commentImagebtn setBackgroundImage:[self loadImage:@"commentimage"] forState:UIControlStateNormal];
        [self.commentImagebtn addTarget:self action:@selector(leftBtn:) forControlEvents:UIControlEventTouchDown];
        _iheight+=20;
        [self addSubview:self.commentImagebtn];

        if ([[goodlable.dicgood valueForKey:[NSString stringWithFormat:@"%ld",(long)_indexgood]] isEqualToString:@"YES"]) {
            self.goodlabel=[[UILabel alloc] initWithFrame:CGRectMake(52, _iheight, WIDTH+260, 15)];
            self.goodlabel.backgroundColor=[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
            self.goodlabel.text=@"♡赞";
            self.goodlabel.textColor=[UIColor blueColor];
            self.goodlabel.font = [UIFont italicSystemFontOfSize:FONTSIZESMALL];
            _iheight+=15;
            [self addSubview:self.goodlabel];

        }
        

        
        NSInteger commentlabelheight=5;
        for (int i=0; i<=[[self describeDictionary:[friendsinfo.comments mutableCopy]][1] intValue]; i++) {
            commentlabelheight+=15;
        }
        
        self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(52, _iheight, WIDTH+260, commentlabelheight)];
        self.commentLabel.backgroundColor=[UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:0.5];
        self.commentLabel.font = [UIFont italicSystemFontOfSize:FONTSIZESMALL];
        self.commentLabel.numberOfLines=0;
        self.commentLabel.text=[self describeDictionary:[friendsinfo.comments mutableCopy]][0];
        for (int i=0; i<=[[self describeDictionary:[friendsinfo.comments mutableCopy]][1] intValue]; i++) {
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

-(void)leftBtn:(id)sender
{
    for(UIView *view in self.tableview.subviews)
    {
        
        if([view isKindOfClass:[UIButton class]]&&(100 == view.tag))
        {
            [view removeFromSuperview];
        }
    }
    
    
    UIButton* button=(UIButton*)sender;
    CGPoint buttonCenter = CGPointMake(button.bounds.origin.x + button.bounds.size.width/2,
                                       button.bounds.origin.y + button.bounds.size.height/2);
    CGPoint p = [button convertPoint:buttonCenter toView:self.tableview];
    
    self.goodbtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.goodbtn.backgroundColor=[UIColor blackColor];
    if ([[goodlable.dicgood valueForKey:[NSString stringWithFormat:@"%ld",(long)_indexgood]] isEqualToString:@"YES"]) {
        [self.goodbtn setTitle:@"取消点赞" forState:UIControlStateNormal];
    }
    else
    {
        [self.goodbtn setTitle:@"赞" forState:UIControlStateNormal];
    }
    [self.goodbtn addTarget:self action:@selector(commentAddGood:) forControlEvents:UIControlEventTouchUpInside];
    self.goodbtn.frame=CGRectMake(p.x-45, p.y-10, WIDTH+5, HEIGHT-10);
    self.goodbtn.tag=100;
    self.goodbtn.titleLabel.font = [UIFont italicSystemFontOfSize:FONTSIZESMALL];
    [self.goodbtn setTintColor:[UIColor whiteColor]];
    [self.tableview addSubview:self.goodbtn];

    
    POPBasicAnimation *popOutAnimation = [POPBasicAnimation animation];
    popOutAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    
    popOutAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(p.x-90, p.y-10, WIDTH+45, HEIGHT-10)];

//    popOutAnimation.springBounciness = 10.0;
//    popOutAnimation.springSpeed = 0.1;
    
    [self.goodbtn pop_addAnimation:popOutAnimation forKey:@"slide"];
    

    
    
}

-(void)commentAddGood:(id)sender
{
    if ([[goodlable.dicgood valueForKey:[NSString stringWithFormat:@"%ld",(long)_indexgood]] isEqualToString:@"YES"])
    {
        [goodlable.dicgood setObject:@"NO" forKey:[NSString stringWithFormat:@"%ld",(long)_indexgood]];
    }
    else
    {
        [goodlable.dicgood setObject:@"YES" forKey:[NSString stringWithFormat:@"%ld",(long)_indexgood]];
    }
   
    for(UIView *view in self.tableview.subviews)
    {
        if([view isKindOfClass:[UIButton class]]&&(100 == view.tag))
        {
            [view removeFromSuperview];
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableview reloadData];
    });
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UIView *view in self.tableview.subviews)
    {
        if([view isKindOfClass:[UIButton class]]&&(100 == view.tag))
        {
            [view removeFromSuperview];
        }
    }
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

-(NSInteger)calculateHeight:(FriendsInfo*)friendsinfo Index:(NSInteger) index

{
    _indexgood=index;
    _iheight=28;
    
    //contentLabel;
    NSUInteger contentheight=(([friendsinfo.content length])*FONTSIZESMALL)/160;
    _iheight+=10*contentheight;
    _iheight+=15;
    
    
    if (friendsinfo.imagecontent!=nil) {
        _iheight+=165;
    }
    
    //time
    _iheight+=20;
    
    if ([[goodlable.dicgood valueForKey:[NSString stringWithFormat:@"%ld",(long)_indexgood]] isEqualToString:@"YES"]) {
        _iheight+=20;
    }

    //comments
    for (int i=0; i<=[[self describeDictionary:[friendsinfo.comments mutableCopy]][1] intValue]; i++) {
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
