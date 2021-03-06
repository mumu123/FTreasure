//
//  DiscoveryViewController.m
//  WinTreasure
//
//  Created by Apple on 16/5/31.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "DiscoveryDetailViewController.h"
#import "ShareViewController.h"
#import "DiscoveryCell.h"

@interface DiscoveryViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableview;

@property (nonatomic, strong) NSMutableArray *datasource;

@property (nonatomic, strong) NSArray *images;

@end


@implementation DiscoveryViewController

- (NSArray *)images {
    if (!_images) {
        _images = @[@[@"list_empty_multi_195x195_"],@[@"discovery1.jpg",@"discovery2.jpg",@"discovery3.jpg"]];
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    [self.view addSubview:self.tableview];
    [self.tabBarController.tabBar hideBadgeOnItemIndex:2];
}

#pragma mark - lazy load
- (NSMutableArray *)datasource {
    if (!_datasource) {
        NSArray *titles = @[@[@"晒单分享"],@[@"速抢1000红包",@"苹果商品全价购",@"让你信服的夺宝"]];
        _datasource = [NSMutableArray arrayWithArray:titles];
    }
    return _datasource;
}

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = ({
            UITableView *tableView = [[UITableView alloc]initWithFrame:({
                CGRect rect = {0, 0, kScreenWidth, kScreenHeight};
                rect;
            }) style:UITableViewStyleGrouped];
            tableView.dataSource = self;
            tableView.delegate = self;
            tableView.rowHeight = 66.0;
            tableView;
        });
    }
    return _tableview;
}

#pragma mark - delegates 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datasource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = self.datasource[section];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DiscoveryCell *cell = [DiscoveryCell cellWithTableView:tableView];
    cell.discoveryImgView.image = IMAGE_NAMED(self.images[indexPath.section][indexPath.row]);
    cell.titleLabel.text = _datasource[indexPath.section][indexPath.row];
    cell.descriptLabel.text = _datasource[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ShareViewController *vc = [[ShareViewController alloc]init];
        [self pushController:vc];
        return;
    }
    NSArray *rows = self.datasource[indexPath.section];
    DiscoveryDetailViewController *vc = [[DiscoveryDetailViewController alloc]init];
    vc.navTitle = rows[indexPath.row];
    [self pushController:vc];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
