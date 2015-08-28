//
//  headerView.h
//  FriendCircleApp
//
//  Created by TWer  on 8/27/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelfResouce.h"
#import "SelfResouceinfomap.h"
#import "Service.h"
#define SELF @"selfresource.json"
@interface HeaderView : UIView
{
    Service* service;
    NSMutableArray* selfresouce;
}
-(id)init:(UITableView *)tableView;
@end
