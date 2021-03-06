//
//  ProfileViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 2016/12/15.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ProfileViewController.h"
#import "SettingViewController.h"
#import "LoginViewController.h"
#import "UserVerifyViewController.h"
#import "WalletViewController.h"

@interface ProfileViewController () <SettingViewControllerDelegate>

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavigationBar];
    
    // 按钮
    UIButton *submitBtn = [UIButton buttonWithTitle:@"提交"
                                        normalColor:CustomGreen
                                   highlightedColor:CustomGreen
                                          titleFont:[UIFont systemFontOfSize:16]
                                          imageName:nil
                                      backImageName:nil
                                             target:self
                                             action:@selector(submitBtnDidClicked)];
    submitBtn.frame = CGRectMake(10, 240, SCREEN_WIDTH - 20, 40);
    submitBtn.backgroundColor = [UIColor lightTextColor];
    submitBtn.layer.cornerRadius = 5.0;
    submitBtn.layer.masksToBounds = YES;
    [self.view addSubview:submitBtn];
    
    UIButton *submitBtn2 = [UIButton buttonWithTitle:@"我的钱"
                                         normalColor:CustomGreen
                                    highlightedColor:CustomGreen
                                           titleFont:[UIFont systemFontOfSize:16]
                                           imageName:nil
                                       backImageName:nil
                                              target:self
                                              action:@selector(wallet)];
    submitBtn2.frame = CGRectMake(100, 40, SCREEN_WIDTH - 30, 100);
    submitBtn2.backgroundColor = [UIColor lightTextColor];
    submitBtn2.layer.cornerRadius = 5.0;
    submitBtn2.layer.masksToBounds = YES;
    [self.view addSubview:submitBtn2
     ];

}

- (void)submitBtnDidClicked {

    UserVerifyViewController *veriftVC = [[UserVerifyViewController alloc] init];
    [self.navigationController pushViewController:veriftVC animated:YES];
}


- (void)wallet {
    
    WalletViewController *wallet = [[WalletViewController alloc] init];
    [self.navigationController pushViewController:wallet animated:YES];
}

#pragma mark - navigation
/// 设置导航栏
- (void)setupNavigationBar {
    
    // 右按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithTitle:@"设置"
                                                                       titleFont:[UIFont systemFontOfSize:16]
                                                                      titleColor:[UIColor whiteColor]
                                                                       imageName:@""
                                                                          target:self
                                                                          action:@selector(rightBarButtonItemDidClicked)];
}

/// 设置
- (void)rightBarButtonItemDidClicked {
    
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
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
