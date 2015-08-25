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
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    servce=[Service new];
    info=[servce readJson:LOCAL];
    [self initView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initView{
    CGRect frame=CGRectMake(0, -40, 380, 700);
    self.friendsTableView=[[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.friendsTableView.dataSource = self;
    self.friendsTableView.delegate = self;
    self.friendsTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.friendsTableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    FriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    if (cell == nil) {
        cell = [[FriendsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSUInteger row = [indexPath row];
    
    FriendsInfoList *friendsinfolist=(FriendsInfoList*)[Friendsinfomap friendsInfo:[info objectAtIndex:row]];

    NSString *icronPath = [[NSBundle mainBundle] pathForResource:friendsinfolist.icron ofType:@"png"];
    NSData *icronimage = [NSData dataWithContentsOfFile:icronPath];
    UIImage *icron = [UIImage imageWithData:icronimage];
    cell.icronImage.image=icron;
    cell.nameLabel.text=friendsinfolist.name;
    cell.contentLabel.text=friendsinfolist.content;
    
    NSString *contentimagePath = [[NSBundle mainBundle] pathForResource:friendsinfolist.imagecontent ofType:@"png"];
    NSData *contentimagedata = [NSData dataWithContentsOfFile:contentimagePath];
    UIImage *contentimage = [UIImage imageWithData:contentimagedata];
    cell.contentImage.image=contentimage;
    
    NSString *commentimagePath = [[NSBundle mainBundle] pathForResource:@"commentimage" ofType:@"png"];
    NSData *commentimagedata = [NSData dataWithContentsOfFile:commentimagePath];
    UIImage *commentimage = [UIImage imageWithData:commentimagedata];
    cell.commentImage.image=commentimage;
    
    cell.timeLabel.text=friendsinfolist.time;
    cell.commentLabel.text=friendsinfolist.comments;
    
    return cell;
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
//    headerLabel.backgroundColor=[UIColor whiteColor];
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
    return 250;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
