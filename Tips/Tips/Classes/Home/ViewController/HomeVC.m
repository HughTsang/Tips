//
//  HomeVC.m
//  Tips
//
//  Created by zenghz on 16/8/16.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import "HomeVC.h"

static NSString * const ReusedID = @"ReusedID";
static NSString * const TitleKey = @"title";
static NSString * const SubTitleKey = @"subTitle";
static NSString * const ImageKey = @"image";

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
    
    NSArray *array = @[@{TitleKey : @"类型1", SubTitleKey : @"<-----副标题---->", ImageKey : @"icon_crown",},
                       @{TitleKey : @"类型2", SubTitleKey : @"<-----副标题---->", ImageKey : @"icon_crown",},
                       @{TitleKey : @"类型3", SubTitleKey : @"<-----副标题---->", ImageKey : @"icon_crown",},
                       @{TitleKey : @"类型4", SubTitleKey : @"<-----副标题---->", ImageKey : @"icon_crown",},
                       @{TitleKey : @"类型5", SubTitleKey : @"<-----副标题---->", ImageKey : @"icon_crown",},
                       @{TitleKey : @"类型6", SubTitleKey : @"<-----副标题---->", ImageKey : @"icon_crown",},];
    [self.listArray addObjectsFromArray:array];
    [self.table reloadData];
}

#pragma mark - 代理和协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReusedID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ReusedID];
    }
    
    cell.textLabel.textColor = [UIColor cSandyOrangeColor];
    cell.detailTextLabel.textColor = [UIColor cDeepSkyBlueColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSDictionary *dict = self.listArray[indexPath.row];
    
    cell.textLabel.text = [dict objectForKey:TitleKey];;
    cell.detailTextLabel.text = dict[SubTitleKey];
    cell.imageView.image = [UIImage imageNamed:dict[ImageKey]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

#pragma mark - 懒加载
- (UITableView *)table{
    
    return Lazy(_table, ({
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 0) style:UITableViewStyleGrouped];
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = [UIColor cGray_6];
        table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:table];
        table;
    }));
}

- (NSMutableArray *)listArray{
    
    return Lazy(_listArray, @[].mutableCopy);
}

@end
