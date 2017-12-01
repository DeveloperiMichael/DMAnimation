//
//  FaceBookPopViewController.m
//  DMAnimation
//
//  Created by 张炯 on 2017/12/1.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "FaceBookPopViewController.h"
#import <Masonry/Masonry.h>

@interface FaceBookPopViewController ()

@property (nonatomic, strong) UIView *springView;
@property (nonatomic, strong) UIButton *startButton;

@end

@implementation FaceBookPopViewController

#pragma mark-
#pragma mark- View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubviewsContraints];
}


#pragma mark-
#pragma mark- Request




#pragma mark-
#pragma mark- Response



#pragma mark-
#pragma mark- SACardViewDataSource




#pragma mark-
#pragma mark- delegate




#pragma mark-
#pragma mark- Event response


#pragma mark-
#pragma mark- Private Methods

- (void)startAnimation:(UIButton *)button {
    CASpringAnimation *ani = [CASpringAnimation animationWithKeyPath:@"position.x"];
    ani.damping = 5;
    ani.stiffness = 100;
    ani.mass = 1;
    ani.initialVelocity = 0;
    ani.fromValue = [NSNumber numberWithFloat:self.view.center.x+100];
    ani.toValue = [NSNumber numberWithFloat:self.view.center.x];
    ani.duration = 2;
    [self.springView.layer addAnimation:ani forKey:@"spring"];
    
}


#pragma mark-
#pragma mark- Getters && Setters

- (UIView *)springView {
    if (!_springView) {
        _springView = [[UIView alloc] init];
        _springView.backgroundColor = [UIColor redColor];
    }
    return _springView;
}

- (UIButton *)startButton {
    if (!_startButton) {
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _startButton.backgroundColor = [UIColor blueColor];
        [_startButton setTitle:@"StartAnimation" forState:UIControlStateNormal];
        _startButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [_startButton addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startButton;
}


#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.springView];
    [self.view addSubview:self.startButton];
    
    [_startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(50);
        make.right.mas_equalTo(self.view).mas_offset(-50);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(self.view).mas_offset(-40);
    }];
    [_springView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
