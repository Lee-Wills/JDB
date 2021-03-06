//
//  GlobalManager.m
//  PrivateTalk
//
//  Created by Heaven on 2016/12/13.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "GlobalManager.h"

@implementation GlobalManager

+ (instancetype)sharedManager {
    
    static GlobalManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}

- (void)loginSuccessedWithUserInfo:(UserInfoData *)userInfoData {
    _userInfoData = userInfoData;

    [[NSUserDefaults standardUserDefaults] setObject:_userInfoData.userId forKey:kUserID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFCATION_USER_STATUSCHANGE object:nil];
}

- (void)refreshWithUserInfo:(UserInfoData *)userInfoData {
    _userInfoData = userInfoData;
    [[NSUserDefaults standardUserDefaults] setObject:_userInfoData.userId forKey:kUserID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFCATION_USER_STATUSCHANGE object:nil];

}

- (NSString *)userId {

    return _userInfoData.userId;
}

- (BOOL)isLogin {
    return _userInfoData ? YES:NO;
}

- (NSString *)hxUserId {
    return [NSString stringWithFormat:@"b%@",_userInfoData.userPhoneNum];
}

- (void)logout {

    _userInfoData = nil;
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kUserID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFCATION_USER_STATUSCHANGE object:nil];
}

@end
