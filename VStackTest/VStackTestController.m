//
//  VStackTestController.m
//
//

#import "VStackTestController.h"
#import "ThirdPartyImplement.h"
#import "DemoViewController.h"
#import "CallHistoryViewController.h"

@implementation VStackTestController

- (void)viewDidLoad {
    [super viewDidLoad];

    //    self.title = @"VStack Test";
    self.tableCells = @[@"Go to Demo fragment", @"Chat with user2", @"Group chat", @"Create Group", @"Chat History",@"Call user2", @"Video call user2", @"Call History"];

    [ThirdPartyImplement instance].navForChatController = self.navigationController;

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableCells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* text = self.tableCells[indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestTableViewTableCell"];
    if (!cell) {
        cell = [UITableViewCell new];
    }
    cell.textLabel.text = text;

    cell.backgroundView=[[UIView alloc] initWithFrame:cell.bounds];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {//go to fragment demo
        DemoViewController *demo = [[DemoViewController alloc] init];
        demo.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:demo animated:YES];
    } else if (indexPath.row == 1){//chat with user2
        [self.navigationController pushViewController:[[VStackManager instance] chatWithUser:@"user2" withUserInfo:@{@"name": @"User 2"} ] animated:YES];
    } else if(indexPath.row == 2){//Group chat
        [self.navigationController pushViewController:[[VStackManager instance] chatWithGroup:@[@"user2", @"user3", @"user4"] withGroupInfo:@{@"name": @"Group 1"} ] animated:YES];
    } else if(indexPath.row == 3){//Create group
        [self.navigationController pushViewController:[[VStackManager instance] createChatGroup] animated:YES];
    } else if (indexPath.row == 4) {//chat history
        [self.navigationController pushViewController:[[VStackManager instance] getChattingHistory] animated:YES];
    } else if (indexPath.row == 5){//audio call user2
        [[VStackManager instance] callWithUser:@"user2" withUserInfo:@{@"name": @"User 2"} ];
    } else if (indexPath.row == 6){// video call user2
        [[VStackManager instance] callVideoWithUser:@"user2" withUserInfo:@{@"name": @"User 2"}];

    }else if (indexPath.row == 7){
        CallHistoryViewController *callHistoryVC = [[CallHistoryViewController alloc] init];
        [self.navigationController pushViewController:callHistoryVC animated:YES];
    }
}

@end
