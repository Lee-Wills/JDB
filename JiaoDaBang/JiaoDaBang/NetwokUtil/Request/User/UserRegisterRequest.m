//
//  UserRegisterRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "UserRegisterRequest.h"
#import "UserRegisterResponse.h"

@interface UserRegisterRequest ()

@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *passWord;
@property (nonatomic, copy) NSString *messageCode;

@end

@implementation UserRegisterRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.URLString = @"registercheck";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithPhoneNumber:(NSString *)phoneNumber {

    self.phoneNumber = phoneNumber;
    }

- (void)parametersWithProperties {

    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    
    NSString *phoneNumber = [NSString AES128ECBEncrypt:self.phoneNumber key:EncryptoKey];
    NSString *passWord = [NSString AES128ECBEncrypt:self.passWord key:EncryptoKey];
    NSString *messageCode = [NSString AES128ECBEncrypt:self.messageCode key:EncryptoKey];
    
    [mDic setObjectSafe:phoneNumber forKey:@"phone_num"];
    [mDic setObjectSafe:passWord forKey:@"password"];
    [mDic setObjectSafe:messageCode forKey:@"value"];

    self.parameters = mDic;
}

ResponserParserGenerate(UserRegisterResponse);

@end
