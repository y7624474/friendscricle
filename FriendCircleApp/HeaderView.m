//
//  headerView.m
//  FriendCircleApp
//
//  Created by TWer  on 8/27/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(id)init:(UITableView *)tableView
{
    if (self==[super init]) {
        service=[Service new];
        selfresouce=[service readJson:SELF];
        
        SelfResouce *selfinfo=(SelfResouce*)[SelfResouceinfomap selfInfo:selfresouce];
        self.frame=CGRectMake(0, 0, tableView.bounds.size.width, 200);
        self.backgroundColor=[UIColor whiteColor];
        
        UIImageView *headerImage =[[UIImageView alloc] initWithImage:[UIImage imageNamed:selfinfo.headimage]];
        headerImage.frame = CGRectMake(0, 0, tableView.bounds.size.width, 180);
        [self addSubview:headerImage];
        
        
        UIImageView *icronImage =[[UIImageView alloc] initWithImage:[UIImage imageNamed:selfinfo.headicron]];
        icronImage.frame = CGRectMake(295, 160, 40, 40);
        [self addSubview:icronImage];
        
        UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 158, 70, 20)];
        headerLabel.font = [UIFont italicSystemFontOfSize:15];
        headerLabel.textColor=[UIColor whiteColor];
        headerLabel.text=selfinfo.headname;
        [self addSubview:headerLabel];
        
    }
    return self;
    
}

@end
