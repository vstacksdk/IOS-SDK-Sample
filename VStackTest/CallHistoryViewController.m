//
//  CallHistoryViewController.m
//  VStack
//
//  Created by Trần Sỹ Quyết on 4/18/17.
//
//

#import "CallHistoryViewController.h"
#import <VStack/VStackCallHistoryTableView.h>

@interface CallHistoryViewController (){
    VStackCallHistoryTableView *tableView;
}

@end

@implementation CallHistoryViewController

- (id) init {
    self = [super init];
    if (self != nil) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"Call History";

    // Khởi tạo VStackCallHistoryTableView
    tableView = [[VStackCallHistoryTableView alloc] init];
    tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
    // set delegate và datasource cho VStackCallHistoryTableView
    [tableView initDelegateAndDatasource];
    // set parentController cho VStackCallHistoryTableView để pushViewController khi click vào 1 row
    tableView.parentController = self;
    [self.view addSubview:tableView];

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
