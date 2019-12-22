//
//  GKMainViewController.m
//  GKNavigationBar
//
//  Created by gaokun on 2019/11/1.
//  Copyright © 2019 QuintGao. All rights reserved.
//

#import "GKMainViewController.h"
#import "GKToutiaoViewController.h"
#import "GKWYMusicViewController.h"
#import "GKTab001ViewController.h"
#import "GKWYNewsViewController.h"
#import "GKDouyinHomeViewController.h"

@interface GKMainViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation GKMainViewController

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"push一个变色导航栏控制器",
                        @"push一个透明导航栏控制器",
                        @"push一个无导航栏控制器",
                        @"push一个UITabBarController",
                        @"present一个UITabBarController",
                        @"push一个UITableView",
                        @"push一个UIScrollView",
                        @"嵌套TZImagePickerController",
                        @"调用系统相册或相机",
                        @"导航条按钮测试",
                        @"分页滑动",
                        @"系统导航",
                        @"左滑push",
                        @"WebView交互",
                        @"抖音左右滑动",
                        @"今日头条",
                        @"网易云音乐",
                        @"网易新闻"];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.gk_navigationItem.title = @"MainVC";
    self.gk_navBackgroundColor = [UIColor blackColor];
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    self.gk_navTitleFont = [UIFont systemFontOfSize:18.0f];
    self.gk_navTitleColor = [UIColor whiteColor];
    
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)setupTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.gk_navigationBar.mas_bottom);
    }];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = [[NSString alloc] initWithFormat:@"GKDemo0%02zdViewController", indexPath.row + 1];
    
    Class class = NSClassFromString(className);
    
    UIViewController *vc = [[class alloc] init];
    
    if (indexPath.row == 4) {
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        
        [self presentViewController:vc animated:YES completion:nil];
        
        return;
    }
    
    if (indexPath.row == 14) {
        GKDouyinHomeViewController *douyinVC = [GKDouyinHomeViewController new];
        
        // 设置导航控制器并开启左滑push
        UINavigationController *nav = [UINavigationController rootVC:douyinVC transitionScale:NO];
        nav.gk_openScrollLeftPush = YES;
        
        nav.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:nav animated:YES completion:nil];
        
        return;
    }else if (indexPath.row == 15) {
        GKToutiaoViewController *toutiaoVC = [GKToutiaoViewController new];
        toutiaoVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:toutiaoVC animated:YES completion:nil];
        
        return;
    }else if (indexPath.row == 16) {
        GKWYMusicViewController *wyMusicVC = [GKWYMusicViewController new];
        
        wyMusicVC.modalPresentationStyle = UIModalPresentationFullScreen;
        // 根视图控制器是UITabBarController,不缩放
        [self presentViewController:wyMusicVC animated:YES completion:nil];
        return;
    }else if (indexPath.row == 17) {
        GKWYNewsViewController *newsVC = [GKWYNewsViewController new];
        
        newsVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:newsVC animated:YES completion:nil];
        return;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
