//
//  UserLoginResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/6.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "UserLoginResponse.h"

@implementation UserLoginResponse

- (void)parseResponseObject {

    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        NSDictionary *dataDic = [jsonObject objectForKeySafe:@"data"];
        if ([dataDic isKindOfClass:[NSDictionary class]]) {
            
            UserInfoData *userInfoData = [[UserInfoData alloc] init];
            userInfoData.userId = [dataDic objectForKeySafe:@"userid"];
            userInfoData.userName = [dataDic objectForKeySafe:@"username"];
            userInfoData.userPhoneNum = [dataDic objectForKeySafe:@"phone_num"];
            userInfoData.userSchool = [dataDic objectForKeySafe:@"school"];
            userInfoData.userAvatar = [dataDic objectForKeySafe:@"avatar"];
            userInfoData.userSex = [dataDic objectForKeySafe:@"sex"];
            userInfoData.userNickName = [dataDic objectForKeySafe:@"nickname"];
            userInfoData.userRealName = [dataDic objectForKeySafe:@"realname"];
            userInfoData.userSchoolNum = [dataDic objectForKeySafe:@"school_num"];
            userInfoData.userClassName = [dataDic objectForKeySafe:@"classname"];
            userInfoData.userType = [dataDic objectForKeySafe:@"usertype"];
            userInfoData.userTypeName = [dataDic objectForKeySafe:@"typename"];
            userInfoData.userGroup = [dataDic objectForKeySafe:@"usergroup"];
            userInfoData.userCreateTime = [dataDic objectForKeySafe:@"createtime"];
            userInfoData.userauthId = [dataDic objectForKeySafe:@"authid"];
            userInfoData.userAliAccount = [dataDic objectForKeySafe:@"aliaccount"];
            userInfoData.userPayPwd = [dataDic objectForKeySafe:@"paypwd"];
            
            
            [self showSuccessInfo:userInfoData];
            
        } else {
        
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];

        }
        
    } else {
        
        [self showFailureInfo:code];
    }

}

@end
