//
//  ViewController.m
//  FriendCircleApp
//
//  Created by TWer  on 8/21/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    Service *servce;
    NSMutableArray* info;
    NSInteger cellhight;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    servce=[Service new];
    info=[servce readJson:LOCAL];
    cellhight=250;
    [self initView];
}

-(void)initView{
    CGRect frame=CGRectMake(0, -40, 380, 710);
    self.friendsTableView=[[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.friendsTableView.dataSource = self;
    self.friendsTableView.delegate = self;
    self.friendsTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.friendsTableView];
    [[LoadData new] createTableFooter:self.friendsTableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    FriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    NSUInteger row = [indexPath row];
    FriendsInfoList *friendsinfolist=(FriendsInfoList*)[Friendsinfomap friendsInfo:[info objectAtIndex:row]];

  
    cell = [[FriendsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier boolImage:[self heightCell:friendsinfolist]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    

    cell.icronImage.image=[self loadImage:friendsinfolist.icron];
    cell.nameLabel.text=friendsinfolist.name;
    cell.contentLabel.text=friendsinfolist.content;
    if ([self heightCell:friendsinfolist]) {
        cell.contentImage.image=[self loadImage:friendsinfolist.imagecontent];
    }
    cell.commentImage.image=[self loadImage:@"commentimage"];
    cell.timeLabel.text=friendsinfolist.time;
    cell.commentLabel.text=friendsinfolist.comments;
    
    return cell;
}

-(BOOL)heightCell:(FriendsInfoList*)friendsinfolist
{
    if (friendsinfolist.imagecontent==nil) {
        return NO;
    }
    return YES;
}



-(UIImage*)loadImage:(NSString*)pathResource
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:pathResource ofType:@"png"];
    NSData *image = [NSData dataWithContentsOfFile:filePath];
    return [UIImage imageWithData:image];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 200)];
    headerView.backgroundColor=[UIColor whiteColor];
    UIImageView *headerImage =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headimage.png"]];
    headerImage.frame = CGRectMake(0, 0, tableView.bounds.size.width, 180);
    [headerView addSubview:headerImage];
    

    UIImageView *icronImage =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headicron.png"]];
    icronImage.frame = CGRectMake(295, 160, 40, 40);
    [headerView addSubview:icronImage];
   
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 158, 70, 20)];
    headerLabel.font = [UIFont italicSystemFontOfSize:15];
    headerLabel.textColor=[UIColor whiteColor];
    headerLabel.text=@"小黑";
    [headerView addSubview:headerLabel];
    return headerView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    return [info count];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = [indexPath row];
    
    FriendsInfoList *friendsinfolist=(FriendsInfoList*)[Friendsinfomap friendsInfo:[info objectAtIndex:row]];
    if (friendsinfolist.imagecontent==nil) {
        cellhight=90;
        NSLog(@"%lu,%ld",(unsigned long)row,(long)cellhight);
        return cellhight;
    }
    else
    {
        cellhight=250;
        NSLog(@"%lu,%ld",(unsigned long)row,(long)cellhight);
    }
    
   return cellhight;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [[LoadData new] loadDataBegin:self.friendsTableView Data:info];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
