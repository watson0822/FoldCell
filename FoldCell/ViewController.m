//
//  ViewController.m
//  FoldCell
//
//  Created by Watson on 2018/2/23.
//  Copyright © 2018年 Watson. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "DataModel.h"
@interface ViewController ()
@property (nonatomic) NSArray<DataModel *> *data;
@property (nonatomic) NSArray<NSIndexPath *> *indexPathArr;
@property (nonatomic) NSIndexPath *indexPath;
@end

@implementation ViewController
- (NSArray<DataModel *> *)data{
    if (!_data) {
        DataModel *m = [DataModel new];
        m.fold = NO;
        m.title = @"西游记";
        m.dataList = @[@"孙悟空", @"猪八戒", @"沙和尚"];
        
        DataModel *m1 = [DataModel new];
        m1.fold = YES;
        m1.title = @"七龙珠";
        m1.dataList = @[@"悟空", @"悟天", @"悟饭"];
        
        _data = @[m, m1];
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.sectionHeaderHeight = 60;
    [self.tableView registerClass:[HeaderView class] forHeaderFooterViewReuseIdentifier:@"head"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    DataModel *d = self.data[section];
    if (d.isFold) {//是折叠的
        return 0;
    }
    return d.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    DataModel *d = self.data[indexPath.section];
    cell.textLabel.text = d.dataList[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    DataModel *d = self.data[section];
    HeaderView *hd = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"head"];
    hd.textLabel.text = d.title;
    hd.section = section;
    
    [hd setTapBlock:^(NSInteger section) {
        DataModel *d = self.data[section];
        d.fold = !d.fold;//展开状态为反值
        //        [tableView reloadData];
        //获取即将发生变化的 cell的 indexPath数组
        NSMutableArray *tmpArr = [NSMutableArray new];
        for (NSInteger i = 0; i < d.dataList.count; i++) {
            NSIndexPath *ip = [NSIndexPath indexPathForRow:i inSection:section];
            [tmpArr addObject:ip];
        }
        if (d.isFold) {
            [tableView deleteRowsAtIndexPaths:tmpArr withRowAnimation:UITableViewRowAnimationFade];
        }else{
            [tableView insertRowsAtIndexPaths:tmpArr withRowAnimation:UITableViewRowAnimationFade];
        }
    }];
    return hd;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
