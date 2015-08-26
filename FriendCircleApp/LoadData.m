//
//  LoadData.m
//  FriendCircleApp
//
//  Created by TWer  on 8/25/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "LoadData.h"

@implementation LoadData

- (void)loadDataBegin:(UITableView*) tableview Data:(NSMutableArray*) arraydata

{
    UIActivityIndicatorView *tableFooterActivityIndicator=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(-20,10,40,40)];
    
    [tableFooterActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    
    [tableview.tableFooterView addSubview:tableFooterActivityIndicator];
    
    [tableFooterActivityIndicator startAnimating];

    [self loadDataing:tableview Data:arraydata];
    
}

-(void)loadDataing:(UITableView*) tableview Data:(NSMutableArray*) arraydata

{
    [arraydata addObjectsFromArray:[[Service new] readJson:MORE]];
    [tableview reloadData];
    [self createTableFooter:tableview];

}


-(void)createTableFooter:(UITableView*) tableview
{
    UIView *tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableview.bounds.size.width, 30)];
    
    UILabel *loadMoreText = [[UILabel alloc] initWithFrame:CGRectMake(0,0,120,20)];
    [loadMoreText setCenter:tableFooterView.center];
    [loadMoreText setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [loadMoreText setText:@"正在加载..."];
    
    [tableFooterView addSubview:loadMoreText];
    tableview.tableFooterView = tableFooterView;
}
@end
