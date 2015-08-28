//
//  ViewController.h
//  FriendCircleApp
//
//  Created by TWer  on 8/21/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadFileService.h"
#import "FriendsCell.h"
#import "Friendsinfomap.h"
#import "LoadData.h"
#import "HeaderView.h"
#define LOCAL @"friendsinfo.json"
#define NEW @"newinfo.json"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) UITableView *friendsTableView;

@end

