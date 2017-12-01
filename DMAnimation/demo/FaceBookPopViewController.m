//
//  FaceBookPopViewController.m
//  DMAnimation
//
//  Created by 张炯 on 2017/12/1.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "FaceBookPopViewController.h"
#import <Masonry/Masonry.h>
#import <pop/POP.h>

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
    //[self scaleAnimation];
    [self.springView.layer removeAllAnimations];
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    
    scaleAnimation.name                = @"SpringAnimation";
    scaleAnimation.delegate            = self;
    
    scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(-2, -2)];
    scaleAnimation.springBounciness    = 20.f;
    scaleAnimation.springSpeed         = 10.f;
    scaleAnimation.dynamicsTension     = 700.f;
    scaleAnimation.dynamicsFriction    = 7.f;
    scaleAnimation.dynamicsMass        = 3.f;
    
    [self.springView pop_addAnimation:scaleAnimation forKey:nil];
}

//- (void)scaleAnimation {
//
//    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
//
//    scaleAnimation.name               = @"scaleSmallAnimation";
//    scaleAnimation.delegate           = self;
//
//    scaleAnimation.duration           = 0.15f;
//    scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(1.25, 1.25)];
//
//    [self.springView pop_addAnimation:scaleAnimation forKey:nil];
//}
//- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished {
//    
//    if ([anim.name isEqualToString:@"scaleSmallAnimation"]) {
//        
//        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
//        
//        scaleAnimation.name                = @"SpringAnimation";
//        scaleAnimation.delegate            = self;
//        
//        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
//        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(-2, -2)];
//        scaleAnimation.springBounciness    = 20.f;
//        scaleAnimation.springSpeed         = 10.f;
//        scaleAnimation.dynamicsTension     = 700.f;
//        scaleAnimation.dynamicsFriction    = 7.f;
//        scaleAnimation.dynamicsMass        = 3.f;
//        
//        [self.springView pop_addAnimation:scaleAnimation forKey:nil];
//        
//    } else if ([anim.name isEqualToString:@"SpringAnimation"]) {
//        
//        //[self performSelector:@selector(scaleAnimation) withObject:nil afterDelay:1];
//    }
//}


#pragma mark-
#pragma mark- Getters && Setters

- (UIView *)springView {
    if (!_springView) {
        _springView = [[UIView alloc] init];
        _springView.backgroundColor = [UIColor redColor];
        _springView.layer.masksToBounds = YES;
        _springView.layer.cornerRadius = 60;
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
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(120);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
