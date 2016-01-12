//
//  ViewRootController.m
//  FriendCircleApp
//
//  Created by TWer  on 8/24/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "ViewRootController.h"
#import "ViewController.h"
#import <MVSpeechSynthesizer.h>
@interface ViewRootController ()
{
    MVSpeechSynthesizer *mvSpeech;
}
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
    
    self.helpTextView=[[UITextView alloc] initWithFrame:CGRectMake(110, 300, 150, 140)];
    self.helpTextView.backgroundColor=[UIColor whiteColor];
    self.helpTextView.text=@"我的朋友圈";
    self.helpTextView.editable = YES;
    self.helpTextView.returnKeyType = UIReturnKeyDefault;
    self.helpTextView.delegate = self;
    self.helpTextView.keyboardType = UIKeyboardTypeDefault;
    
    
    
    mvSpeech=[MVSpeechSynthesizer sharedSyntheSize];
    mvSpeech.higlightColor=[UIColor yellowColor];
    mvSpeech.isTextHiglight=YES;
   
    mvSpeech.speechLanguage=@"zh-cn";
   
    mvSpeech.inputView=self.helpTextView;
   //Initialize the read function.
    mvSpeech.speechFinishBlock=^(AVSpeechSynthesizer *synthesizer, AVSpeechUtterance *utterence){

    
    };
    [self.view addSubview:self.helpTextView];

    
    
    UIToolbar *testToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(20.0f, 630.0f, 330.0f, 40.0f)];
    testToolBar.barStyle = UIBarStyleDefault;
    NSMutableArray *testToolBarItems = [NSMutableArray array];
    
    [testToolBarItems addObject:[[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
                                 target:self
                                 action:@selector(voicebegin:)]];
    
    [testToolBarItems addObject:[[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                 target:nil
                                 action:nil]];

    
    [testToolBarItems addObject: [[UIBarButtonItem alloc] initWithTitle:@"朋友" style: UIBarButtonItemStylePlain target: nil
                                action: nil]];
    
    [testToolBarItems addObject:[[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                 target:nil
                                 action:nil]];
    
    [testToolBarItems addObject:[[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                 target:self
                                 action:@selector(action)]];
    
    [testToolBar setItems:testToolBarItems animated:YES];
    
    [self.view addSubview:testToolBar];

    
    UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    longPressGr.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:longPressGr];
    
    UIPanGestureRecognizer * pinPressGr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pinPressToDo:)];
//    pinPressGr.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:pinPressGr];
    // Do any additional setup after loading the view.
}

-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:@"长按！"
                                                     delegate:nil
                                            cancelButtonTitle:@"确定"
                                            otherButtonTitles:nil];
        [alert show];
    }
}

-(void)pinPressToDo:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:@"双指"
                                                     delegate:nil
                                            cancelButtonTitle:@"确定"
                                            otherButtonTitles:nil];
        [alert show];
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.helpTextView resignFirstResponder];
}

-(void)voicebegin:(id)sender
{
     mvSpeech.speechString=self.helpTextView.text;
     [mvSpeech startRead];
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
