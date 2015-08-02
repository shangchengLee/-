//
//  LSCTestCell.h
//  自动布局测试
//
//  Created by 兜麦 on 15/8/2.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LSCTestModel;

@interface LSCTestCell : UITableViewCell

/** 传递模型数据 */
@property (nonatomic, strong) LSCTestModel *testModel;

/** 快速创建cell */
//+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
