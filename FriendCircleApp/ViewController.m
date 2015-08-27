

#import "ViewController.h"

@interface ViewController ()
{
    Service *servce;
    NSMutableArray* info;
    NSMutableArray* selfresouce;
    NSInteger cellhight;
    LoadData *loaddata;
    UIActivityIndicatorView *activityIndicator;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    servce=[Service new];
    loaddata=[LoadData new];
    info=[servce readJson:LOCAL];
    selfresouce=[servce readJson:SELF];
    [self initView];
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera  target:self action:nil];
    self.navigationItem.rightBarButtonItem = cameraButton;
}

-(void)initView{
    CGRect frame=CGRectMake(0, -40, 380, 710);
    self.friendsTableView=[[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    self.friendsTableView.dataSource = self;
    self.friendsTableView.delegate = self;
    self.friendsTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.friendsTableView];
    [loaddata createTableFooter:self.friendsTableView];
    
    activityIndicator = [[UIActivityIndicatorView alloc]
                        initWithActivityIndicatorStyle:
                        UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.color = [UIColor redColor];
    activityIndicator.frame =CGRectMake(15, 75, 40, 40);
    [self.view addSubview:activityIndicator];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    FriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    NSUInteger row = [indexPath row];
    FriendsInfo *friendsinfo=(FriendsInfo*)[Friendsinfomap friendsInfo:[info objectAtIndex:row]];
  
    cell = [[FriendsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier FriendsInfo:friendsinfo];
    
    return cell;
}


- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SelfResouce *selfinfo=(SelfResouce*)[SelfResouceinfomap selfInfo:selfresouce];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 200)];
    headerView.backgroundColor=[UIColor whiteColor];

    UIImageView *headerImage =[[UIImageView alloc] initWithImage:[UIImage imageNamed:selfinfo.headimage]];
    headerImage.frame = CGRectMake(0, 0, tableView.bounds.size.width, 180);
    [headerView addSubview:headerImage];
    

    UIImageView *icronImage =[[UIImageView alloc] initWithImage:[UIImage imageNamed:selfinfo.headicron]];
    icronImage.frame = CGRectMake(295, 160, 40, 40);
    [headerView addSubview:icronImage];
   
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 158, 70, 20)];
    headerLabel.font = [UIFont italicSystemFontOfSize:15];
    headerLabel.textColor=[UIColor whiteColor];
    headerLabel.text=selfinfo.headname;
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
    
    FriendsInfo *friendsinfo=(FriendsInfo*)[Friendsinfomap friendsInfo:[info objectAtIndex:row]];
    
    return [[FriendsCell new] calculateHeight:friendsinfo];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y<= -60) {
        [activityIndicator startAnimating];
        [info removeAllObjects];
        info=[servce readJson:NEW];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.friendsTableView reloadData];
        });
        [activityIndicator stopAnimating];
        return;
    }
    
    [loaddata loadDataBegin:self.friendsTableView Data:info];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
