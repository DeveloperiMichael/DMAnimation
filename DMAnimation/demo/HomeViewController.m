//
//  HomeViewController.m
//  DMAnimation
//
//  Created by 张炯 on 2017/8/3.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "HomeViewController.h"
#import <Masonry/Masonry.h>
#import "CATransitionViewController.h"
#import "CABasicViewController.h"
#import "CAKeyFrameViewController.h"
#import "CASpringAnimationViewController.h"
#import "FaceBookPopViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation HomeViewController

#pragma mark-
#pragma mark- View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CAAnimation";
    [self setupSubviewsContraints];
}


#pragma mark-
#pragma mark- Request




#pragma mark-
#pragma mark- Response






#pragma mark-
#pragma mark- delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"customCell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            CATransitionViewController *vc = [[CATransitionViewController alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 1:
        {
            CABasicViewController *vc = [[CABasicViewController alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            CAKeyFrameViewController *vc = [[CAKeyFrameViewController alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            CASpringAnimationViewController *vc = [[CASpringAnimationViewController alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            FaceBookPopViewController *vc = [[FaceBookPopViewController alloc] init];
            vc.title = self.dataArray[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark-
#pragma mark- Event response



#pragma mark-
#pragma mark- Private Methods




#pragma mark-
#pragma mark- Getters && Setters

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray arrayWithObjects:@"CATransition",@"CABasicAnimation",@"CAKeyFrameAnimation",@"CASpringAnimation",@"CAAnimationGrop",@"UIView Transition",@"FaceBook Pop Animation", nil];
    }
    return _dataArray;
}

#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
