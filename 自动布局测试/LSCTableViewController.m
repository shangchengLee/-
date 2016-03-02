//
//  LSCTableViewController.m
//  自动布局测试
//
//  Created by 兜麦 on 15/8/2.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

// 248458280  技术交流群   一起去吃小龙虾
#import "LSCTableViewController.h"
#import "LSCTestModel.h"
#import "LSCTestCell.h"
#import "MJExtension.h"
#import "Masonry.h"
#import "PureLayout.h"
#import "UITableView+FDTemplateLayoutCell.h"


@interface LSCTableViewController ()<UITableViewDelegate,UITableViewDataSource>

/** 数据懒加载 */
@property (nonatomic, strong) NSArray *listData;
@property (nonatomic, strong) UIButton *test;
@property (nonatomic, strong) UILabel *tex;
@end

@implementation LSCTableViewController

static NSString *ID = @"TestCell";

/** 数据懒加载 */
- (NSArray *)listData
{
    if (!_listData) {
        NSString *pathFile= [[NSBundle mainBundle] pathForResource:@"data.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:pathFile];
        NSError *error = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        self.listData = [LSCTestModel objectArrayWithKeyValuesArray:dict[@"feed"]];
         [self.tableView reloadData];
      
    }
    return _listData;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /** 设置数据源 */
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    /** 注册cell */
    [self.tableView registerClass:[LSCTestCell class] forCellReuseIdentifier:ID];
    
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSCTestCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    /** 传递模型 */
    [self setModelOfCell:cell anIndexPath:indexPath];
    
    return cell;
}

- (void)setModelOfCell:(LSCTestCell *)cell anIndexPath:(NSIndexPath *)indexPath
{
    
//    cell.fd_enforceFrameLayout = YES;
    cell.testModel = self.listData[indexPath.row];
}

/** 计算行高 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tableView fd_heightForCellWithIdentifier:ID cacheByIndexPath:indexPath configuration:^(LSCTestCell *cell) {
        [self setModelOfCell:cell anIndexPath:indexPath];
    }];
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}



@end
