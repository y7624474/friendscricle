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
#import "ReadFileService.h"

#define SELF @"selfresource.json"
#define FONTSIZELARGE 15
@interface HeaderView : UIView
{
    ReadFileService* service;
    NSMutableArray* selfresouce;
}
-(id)init:(UITableView *)tableView;
@end
