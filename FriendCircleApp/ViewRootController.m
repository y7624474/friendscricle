//
//  ViewRootController.m
//  FriendCircleApp
//
//  Created by TWer  on 8/24/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "ViewRootController.h"
#import "ViewController.h"
@interface ViewRootController ()

@end

@implementation ViewRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    self.button=[[UIButton alloc] initWithFrame:CGRectMake(110, 200, 150, 40)];
    SEL eventHander=@selector(clicknumbtn:);
    [self.button addTarget:self action:eventHander forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@"朋友圈" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    
    // Do any additional setup after loading the view.
}

-(void)clicknumbtn:(id)sender
{
    ViewController *friendsView = [[ViewController alloc] init];
    [self.navigationController pushViewController:friendsView animated:YES];
    friendsView.title = @"朋友圈";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
