//
//  VStackManager.h
//  VStack
//
//  Created by Nguyen Van Phu on 7/18/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define AZSERVER_PRODUCTION 1
#define AZSERVER_TEST 2


@class VStackUser;

typedef void (^ConnectWithCompletion)(NSString * authenticatedVStackUserID, NSError * error, BOOL successful);

@protocol VSUserInfoDelegate <NSObject>
@required
- (void) vsRequestUserInfo: (NSArray *) vStackUserIds withTarget: (int) target;
@optional
- (NSArray *) vsRequestFriendList;
- (UIViewController *) vsRequestUserInfoController: (VStackUser *) user withVStackUserId: (NSString *) vStackUserId;
@end

@protocol VSChatDelegate <NSObject>
@required
- (UINavigationController *) vsRequestNavigationToPushChatController;
@optional
- (void) vsUpdateUnreadMessageCount: (int) unreadCount;
- (void) viewFormUp;   // text box chat up
- (void) viewFormDown; // text box chat down
@end

@protocol VSCallDelegate <NSObject>
@optional
- (void) vsJustFinishCall: (NSDictionary *) callInfo;
- (void) onCallDurationWithId: (int) callId ofVStackUserId: (NSString *) vStackUserId duration: (long) duration;
- (void) onCallRingingWithId: (int) callId ofVStackUserId: (NSString *) vStackUserId status: (int) status;
- (void) onCallAnswerWithId: (int) callId ofVStackUserId: (NSString *) vStackUserId status: (int) status;
- (void) onCallEndWithId: (int) callId ofVStackUserId: (NSString *) vStackUserId status: (int) status;
@end

@interface VStackManager : NSObject

+ (VStackManager*)instance;

@property (nonatomic, weak) id<VSUserInfoDelegate> vsUserInfoDelegate;
@property (nonatomic, weak) id<VSChatDelegate> vsChatDelegate;
@property (nonatomic, weak) id<VSCallDelegate> vsCallDelegate;

- (void) setAppId: (NSString *) appId;

- (void) setPublicKey: (NSString *) publicKey;

- (void) connectWithVStackUserId: (NSString *) vStackUserID userCredentials: (NSString *) userCredentials fullname:(NSString *)fullname completion: (ConnectWithCompletion) blockProcessResult;

- (void) updateFullnameForPushNotification: (NSString *) name;

- (void) updateUserInfo: (NSDictionary *) userInfo;

- (void) setTintColorNavigationBar: (UIColor *) tintColorNav;

- (void) setLanguage: (NSString *) language;

- (void) setDebugLog: (BOOL) logEnable;

- (void) setHiddenButtonCallInChatNavigationBar: (BOOL) hidden;

- (void) settingMessageNotification:(NSDictionary *) dicSetting;

- (void) initial;

- (void) setUseSSL: (BOOL) useSSL;

- (UIViewController *) chatWithUser: (NSString *) vStackUserId withUserInfo: (NSDictionary *) userInfo;

- (UIViewController *) chatWithUser: (NSString *) vStackUserId;

- (UIViewController *) createChatGroup;

- (UIViewController *) createChat11;

- (void) sendUserInfoToVStack:(NSArray *) userInfos withTarget: (int) target;

- (UIViewController *) chatWithGroup: (NSArray *) vStackUserIds withGroupInfo: (NSDictionary *) groupInfo;

- (UIViewController *) getChattingHistory;

- (void) callWithUser: (NSString *) vStackUserId withUserInfo: (NSDictionary *) userinfo;

- (void) callWithUser: (NSString *) vStackUserId;

- (void) callVideoWithUser: (NSString *) vStackUserId withUserInfo: (NSDictionary *) userinfo;

- (void) callVideoWithUser: (NSString *)vStackUserId;

- (void) doneSelectUsers: (UIViewController *) chatController withListVStackUsers: (NSArray *) listVStackUsers;

- (void) setServerType: (int) serverType;

- (void) registerForRemoteNotificationsWithDeviceToken: (NSData *) deviceToken;

- (void) processLocalNotify: (UILocalNotification *)notif;

- (void) processRemoteNotify:(NSDictionary *)userInfo;

- (void) processRemoteNotify:(NSDictionary *)userInfo inBackground: (BOOL) inBackground;

- (void) unregisterPushNotification;

- (void) disconnectVSServer;

- (void) clearAllVSData;

- (void) disconnectAndClearAllData;

- (UIViewController*) getChatRooms;

- (UIViewController*) getChannelListController;

- (VStackUser *) getVSUser: (NSString *) vStackUserId;

- (NSArray *) getRecentVSUsersList;

/* 
    set time limited for call
    timeLimited is miliseconds
*/
- (void) setLimitedTime: (long) timeLimited;
@end
