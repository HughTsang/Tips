//
//  HomeVC.m
//  Tips
//
//  Created by zenghz on 16/8/16.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import "HomeVC.h"

static NSString * const ReusedID = @"ReusedID";

@interface HomeVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation HomeVC

#pragma mark - 初始化和生命周期
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createUI];
}

#pragma mark - 自定义方法
- (void)createUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *array = @[@"类型1",
                       @"类型2",
                       @"类型3",
                       @"类型4",
                       @"类型5",
                       @"类型6",];
    [self.listArray addObjectsFromArray:array];
    [self.table reloadData];
}

#pragma mark - 代理和协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusedID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ReusedID];
    }
    
    cell.textLabel.text = self.listArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

#pragma mark - 懒加载
- (UITableView *)table{
    
    return Lazy(_table, ({
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20) style:UITableViewStylePlain];
        table.delegate = self;
        table.dataSource = self;
        table.alwaysBounceVertical = YES;
        table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:table];
        table;
    }));
}

- (NSMutableArray *)listArray{
    
    return Lazy(_listArray, @[].mutableCopy);
}

@end
