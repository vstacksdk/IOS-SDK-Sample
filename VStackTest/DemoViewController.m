//
//  DemoViewController.m
//  VStackTest
//
//  Created by Trần Sỹ Quyết on 4/10/17.
//  Copyright © 2017 Nguyen Van Phu. All rights reserved.
//

#import "DemoViewController.h"
#import <VStack/VStackManager.h>


@interface DemoViewController ()

@end

@implementation DemoViewController{
    UIViewController *view1;
    UIView *segment;
    UILabel *tab1;
    UILabel *tab2;
}

- (id) init {
    self = [super init];
    if (self != nil) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Khởi tạo tab

    segment = [[UIView alloc] init];
    segment.frame = CGRectMake(0, self.view.frame.size.height/2-80, self.view.frame.size.width, 40);
    segment.backgroundColor = [UIColor redColor];
    [self.view addSubview:segment];

    tab1 = [[UILabel alloc] init];
    tab1.frame = CGRectMake(0, 0, segment.frame.size.width/2, 40);
    tab1.textColor = [UIColor grayColor];
    tab1.textAlignment = NSTextAlignmentCenter;
    tab1.text = @"tab1";

    [segment addSubview:tab1];

    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1)];
    [tab1 addGestureRecognizer:tap1];
    tab1.userInteractionEnabled = YES;

    tab2 = [[UILabel alloc] init];
    tab2.frame = CGRectMake(segment.frame.size.width/2, 0, segment.frame.size.width/2, 40);
    tab2.textColor = [UIColor grayColor];
    tab2.text = @"tab2";
    tab2.textAlignment = NSTextAlignmentCenter;


    [segment addSubview:tab2];

    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2)];
    [tab2 addGestureRecognizer:tap2];
    tab2.userInteractionEnabled = YES;


    // khởi tạo view chat cho tab

    view1 = [[VStackManager instance] chatWithUser:@"user1"];
    view1.view.frame = CGRectMake(0, self.view.frame.size.height/2-40, self.view.frame.size.width, self.view.frame.size.height/2+40);

    // set delegate cho sự kiện up/down text box
    // - (void) viewFormUp;
    // - (void) viewFormDown;
    [VStackManager instance].vsChatDelegate = self;

    // thêm view controller vào 1 view controller
    [self displayContentController:view1];
}



- (void) displayContentController: (UIViewController*) content;
{
    [self addChildViewController:content];                 // 1
    content.view.frame = CGRectMake(0, self.view.bounds.size.height/2-40, self.view.bounds.size.width, self.view.bounds.size.height/2+40);                 //2
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];          // 3
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark VSChatDelegate


// text box up
- (void)viewFormUp{
    NSLog(@"up");
    [UIView animateWithDuration:0.25
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         segment.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);

                         view1.view.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-40);
                     }
                     completion:^(BOOL finished){
                     }];


}

// text box down
- (void)viewFormDown{
    NSLog(@"down");
    [UIView animateWithDuration:0.25
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         segment.frame = CGRectMake(0, self.view.frame.size.height/2-80, self.view.frame.size.width, 40);

                         view1.view.frame = CGRectMake(0, self.view.bounds.size.height/2-40, self.view.bounds.size.width, self.view.bounds.size.height/2+40);
                     }
                     completion:^(BOOL finished){
                     }];

}

#pragma mark tab

- (void) tap1{
    view1.view.hidden = NO;
//    tab1.textColor = [UIColor grayColor];
//    tab1.backgroundColor = [UIColor whiteColor];
//
//    tab2.textColor = [UIColor whiteColor];
//    tab2.backgroundColor = [UIColor grayColor];
}

- (void) tap2{
    [self.view endEditing:YES];
    view1.view.hidden = YES;

//    tab1.textColor = [UIColor whiteColor];
//    tab1.backgroundColor = [UIColor grayColor];
//
//    tab2.textColor = [UIColor grayColor];
//    tab2.backgroundColor = [UIColor whiteColor];
}


@end
