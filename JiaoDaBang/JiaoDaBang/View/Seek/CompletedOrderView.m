//
//  CompletedOrderView.m
//  JiaoDaBang
//
//  Created by Heaven on 08/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "CompletedOrderView.h"
#import "CompletedOrderTableViewCell.h"

@interface CompletedOrderView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataListArray;

@property (nonatomic, strong) NSString *page;


@end

@implementation CompletedOrderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.page = @"1";
        [self placeSubview];
    }
    return self;
}

- (void)placeSubview {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:tableView];
    self.tableView = tableView;
    RefreshAutoStateNormalFooter *footer = [RefreshAutoStateNormalFooter footerWithRefreshingBlock:^{
        [self loadData];
    }];
    footer.stateLabel.hidden = YES;
    footer.refreshingTitleHidden = YES;
    self.tableView.footer = footer;
    [self.tableView.footer beginRefreshing];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataListArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OrderData *orderData = self.dataListArray[indexPath.row];
    
    CompletedOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"order"];
    if (cell == nil) {
        cell = [[CompletedOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"order"];
    }
    
    cell.orderData = orderData;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OrderData *orderData = self.dataListArray[indexPath.row];
    
    if ([self.delegate respondsToSelector:@selector(jumptoDetailWithOrderData:)]) {
        [self.delegate jumptoDetailWithOrderData:orderData];
    }
}

- (void)loadData {
    
    GetOrderListRequest *request = [[GetOrderListRequest alloc] init];
    [request setParametersWithUserId:[GlobalManager sharedManager].userId acceptUserId:@"" page:self.page action:@"-2"];
    [request setSuccessBlock:^(id object, id responseObject) {
        
        DLog(@"-------订单请求成功-------");
        
        self.page = [NSString stringWithFormat:@"%d", self.page.integerValue+1];
        
        OrderListData *listData = (OrderListData *)object;
        
        [self.dataListArray addObjectsFromArray:listData.listDataArray];
        
        if (self.dataListArray.count >= listData.orderCount.integerValue || listData.listDataArray.count == 0) {
            
            [self.tableView.footer endRefreshingWithNoMoreData];
        } else {
            
            [self.tableView.footer endRefreshing];
        }
        
        [self.tableView reloadData];
    }];
    [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
        
        DLog(@"-------订单请求失败-------");
        
        [self.tableView.footer endRefreshing];
        
    }];
    [request sendRequest];
    
}

- (NSMutableArray *)dataListArray {
    
    if(_dataListArray == nil) {
        
        _dataListArray = [[NSMutableArray alloc] init];
    }
    return _dataListArray;
}


@end
