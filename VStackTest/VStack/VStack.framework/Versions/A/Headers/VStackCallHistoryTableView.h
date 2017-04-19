//
//  CallHistoryTableView.h
//  VStack
//
//  Created by Trần Sỹ Quyết on 4/18/17.
//
//

#import <UIKit/UIKit.h>

@interface VStackCallHistoryTableView : UITableView<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, weak) UIViewController * parentController;

- (void) initDelegateAndDatasource;

@end
