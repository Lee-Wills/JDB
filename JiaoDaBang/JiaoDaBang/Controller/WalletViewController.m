//
//  WalletViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "WalletViewController.h"

@interface WalletViewController ()

@property (nonatomic, weak) UILabel *balanceLabel;
@property (nonatomic, weak) UIView *withdrawView;

@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的钱包";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setupUI];
}

- (void)setupUI{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    backView.backgroundColor = [UIColor colorWithHexString:@"#8BC34A"];
    [self.view addSubview:backView];
    
    UILabel *moneyLabel = [[UILabel alloc] init];
    moneyLabel.text = @"账户余额";
    moneyLabel.textColor = [UIColor whiteColor];
    moneyLabel.font = [UIFont systemFontOfSize:18];
    [backView addSubview:moneyLabel];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.centerX.equalTo(backView.mas_centerX);
    }];
    
    UILabel *balanceLabel = [[UILabel alloc] init];
    balanceLabel.text = @"账户余额";
    balanceLabel.textColor = [UIColor whiteColor];
    balanceLabel.font = [UIFont systemFontOfSize:28];
    self.balanceLabel = balanceLabel;
    [backView addSubview:balanceLabel];
    [balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(moneyLabel.mas_bottom).offset (10);
        make.centerX.equalTo(backView.mas_centerX);
    }];

    UIButton *withDrawBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    withDrawBtn.backgroundColor = [UIColor whiteColor];
    withDrawBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [withDrawBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [withDrawBtn setTitle:@"    提现" forState:UIControlStateNormal];
    [self.view addSubview:withDrawBtn];
    [withDrawBtn addTarget:self action:@selector(withDrawBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [withDrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@200);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@60);
    }];
    
    // 分割线
    UIView *breakView = [[UIView alloc] initWithFrame:CGRectMake(0, 260, SCREEN_WIDTH, 0.5)];
    breakView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:breakView];

    
    UIButton *billBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    billBtn.backgroundColor = [UIColor whiteColor];
    billBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [billBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [billBtn setTitle:@"    账单记录" forState:UIControlStateNormal];
    [self.view addSubview:billBtn];
    [billBtn addTarget:self action:@selector(billBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [billBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@260.5);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@60);
    }];
    
    // 分割线
    UIView *breakView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 320, SCREEN_WIDTH, 0.5)];
    breakView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:breakView1];
    
    UIButton *verifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    verifyBtn.backgroundColor = [UIColor whiteColor];
    verifyBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [verifyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [verifyBtn setTitle:@"    认证" forState:UIControlStateNormal];
    [self.view addSubview:verifyBtn];
    [verifyBtn addTarget:self action:@selector(verifyBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@320.5);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@60);
    }];
    
}

- (void)withDrawBtnDidClicked {

    
}

- (void)billBtnDidClicked {
    
    
}

- (void)verifyBtnDidClicked {
    
    
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
