//
//  CareSoftUser.h
//  AzStack
//
//  Created by Nguyen Van Phu on 7/18/16.
//
//

#import <Foundation/Foundation.h>

@interface VStackUser : NSObject

@property (nonatomic, strong) NSString* fullname;
@property (nonatomic, strong) NSString* avatar;
@property (nonatomic, strong) NSNumber* sex;
@property (nonatomic, strong) NSString* phoneNumber;
@property (nonatomic, strong) NSString* statusMessage;
@property (nonatomic, strong) NSString * vStackUserId;
@property (nonatomic, assign) int statusOnline;
@property (nonatomic, assign) int lastOnline;

@end
