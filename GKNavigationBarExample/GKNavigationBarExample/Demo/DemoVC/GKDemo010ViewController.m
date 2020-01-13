//
//  GKDemo010ViewController.m
//  GKNavigationBarViewControllerDemo
//
//  Created by gaokun on 2018/12/21.
//  Copyright © 2018 gaokun. All rights reserved.
//

#import "GKDemo010ViewController.h"
#import "GKDemo014ViewController.h"

@interface GKDemo010ViewController ()

@property (nonatomic, strong) UILabel   *textLabel;

@property (nonatomic, strong) UISwitch  *itemSwitch;

@property (nonatomic, strong) UIBarButtonItem   *backBtn;
@property (nonatomic, strong) UIBarButtonItem   *closeBtn;

@property (nonatomic, strong) UIBarButtonItem   *shareBtn;
@property (nonatomic, strong) UIBarButtonItem   *moreBtn;

@end

@implementation GKDemo010ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navigationItem.title = @"导航条测试";
    
    self.gk_navBackgroundColor = [UIColor grayColor];
    
    self.gk_navLeftBarButtonItem = self.backBtn;
    self.gk_navRightBarButtonItem = self.moreBtn;
    self.gk_navItemLeftSpace = 40;
    self.gk_navItemRightSpace = 40;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textLabel = [UILabel new];
    self.textLabel.text = @"显示多个item";
    self.textLabel.frame = CGRectMake(50, 200, 200, 40);
    self.textLabel.textColor = [UIColor redColor];
    self.textLabel.font = [UIFont systemFontOfSize:16.0f];
    self.textLabel.userInteractionEnabled = YES;
    [self.view addSubview:self.textLabel];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textClick)];
    [self.textLabel addGestureRecognizer:tap];
     
    self.itemSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(250, 200, 0, 0)];
    [self.view addSubview:self.itemSwitch];
    [self.itemSwitch addTarget:self action:@selector(witchClick:) forControlEvents:UIControlEventValueChanged];
}

- (void)textClick {
    GKDemo014ViewController *demoVC = [GKDemo014ViewController new];
    [self.navigationController pushViewController:demoVC animated:YES];
}

- (void)witchClick:(id)sender {
    if (self.itemSwitch.on) {
        self.gk_navLeftBarButtonItems = @[self.backBtn, self.closeBtn];
        self.gk_navRightBarButtonItems = @[self.moreBtn, self.shareBtn];
    }else {
        self.gk_navLeftBarButtonItems = nil;
        self.gk_navRightBarButtonItems = nil;
        self.gk_navLeftBarButtonItem = self.backBtn;
        self.gk_navRightBarButtonItem = self.moreBtn;
    }
}

#pragma mark - 懒加载
- (UIBarButtonItem *)backBtn {
    if (!_backBtn) {
        UIButton *back = [UIButton new];
        back.frame = CGRectMake(0, 0, 44, 44);
        [back setImage:[UIImage gk_imageNamed:@"btn_back_black"] forState:UIControlStateNormal];
        back.backgroundColor = [UIColor redColor];
        
        _backBtn = [[UIBarButtonItem alloc] initWithCustomView:back];
    }
    return _backBtn;
}

- (UIBarButtonItem *)closeBtn {
    if (!_closeBtn) {
        UIButton *close = [UIButton new];
        close.frame = CGRectMake(0, 0, 44, 44);
        [close setTitle:@"关闭" forState:UIControlStateNormal];
        [close setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        close.backgroundColor = [UIColor redColor];
        
        _closeBtn = [[UIBarButtonItem alloc] initWithCustomView:close];
    }
    return _closeBtn;
}

- (UIBarButtonItem *)shareBtn {
    if (!_shareBtn) {
        UIButton *share = [UIButton new];
        share.frame = CGRectMake(0, 0, 44, 44);
        [share setTitle:@"分享" forState:UIControlStateNormal];
        [share setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        share.backgroundColor = [UIColor redColor];
        
        _shareBtn = [[UIBarButtonItem alloc] initWithCustomView:share];
    }
    return _shareBtn;
}

- (UIBarButtonItem *)moreBtn {
    if (!_moreBtn) {
        UIButton *more = [UIButton new];
        more.frame = CGRectMake(0, 0, 44, 44);
        [more setTitle:@"更多" forState:UIControlStateNormal];
        [more setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        more.backgroundColor = [UIColor redColor];
        
        _moreBtn = [[UIBarButtonItem alloc] initWithCustomView:more];
    }
    return _moreBtn;
}

@end
