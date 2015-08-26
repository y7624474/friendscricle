//
//  ViewController.h
//  FriendCircleApp
//
//  Created by TWer  on 8/21/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service.h"
#import "FriendsCell.h"
#import "Friendsinfomap.h"
#import "SelfResouceinfomap.h"
#import "LoadData.h"
#define LOCAL @"friendsinfo.json"
#define SELF @"selfresource.json"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) UITableView *friendsTableView;

@end

