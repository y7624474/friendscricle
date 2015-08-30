

#import "ViewController.h"

@interface ViewController ()
{
    ReadFileService *servce;
    NSMutableArray* jsondata;
    NSMutableArray* selfresouce;
    NSInteger cellhight;
    LoadData *loaddata;
    UIActivityIndicatorView *activityIndicator;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    servce=[ReadFileService new];
    loaddata=[LoadData new];
    jsondata=[servce readJson:LOCAL];
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
    FriendsCell *cell;
    NSUInteger row = [indexPath row];
    FriendsInfo *friendsinfo=(FriendsInfo*)[Friendsinfomap friendsInfo:[jsondata objectAtIndex:row]];
  
    cell = [[FriendsCell alloc]initWithStyle:UITableViewCellStyleSubtitle FriendsInfo:friendsinfo Tableview:self.friendsTableView];
    
    return cell;
}


- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[HeaderView alloc] init:tableView];
    return headerView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    return [jsondata count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = [indexPath row];
    
    FriendsInfo *friendsinfo=(FriendsInfo*)[Friendsinfomap friendsInfo:[jsondata objectAtIndex:row]];
    
    return [[FriendsCell new] calculateHeight:friendsinfo];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y<= -60) {
        [activityIndicator startAnimating];
        [jsondata removeAllObjects];
        jsondata=[servce readJson:NEW];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.friendsTableView reloadData];
        });
        [activityIndicator stopAnimating];
        return;
    }
    
    [loaddata loadDataBegin:self.friendsTableView Data:jsondata];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
