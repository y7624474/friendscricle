//
//  LoadData.h
//  FriendCircleApp
//
//  Created by TWer  on 8/25/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadFileService.h"
#define MORE @"more.json"
#define FONTSIZESMALL 14
@interface LoadData : UIViewController
- (void)loadDataBegin:(UITableView*) tableview Data:(NSMutableArray*) arraydata;
-(void)createTableFooter:(UITableView*) tableview;
@end
