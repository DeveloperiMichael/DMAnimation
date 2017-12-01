//
//  CAKeyFrameViewController.m
//  DMAnimation
//
//  Created by 张炯 on 2017/8/4.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "CAKeyFrameViewController.h"
#import <Masonry/Masonry.h>

@interface CAKeyFrameViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIView *movePoint;
@property (nonatomic, strong) CAShapeLayer *myShapeLayer;
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) UIView *rectPoint;


@end

@implementation CAKeyFrameViewController

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

- (void)startAnimation:(UIButton *)button {
    [self layerAnimation];
    [self testMove];//用values作路径
    [self testMove2];//用贝塞尔曲线作路径
}

#pragma mark-
#pragma mark- Private Methods

/**
 （1）values属性
 
 values属性指明整个动画过程中的关键帧点，需要注意的是，起点必须作为values的第一个值。
 
 （2）path属性
 
 作用与values属性一样，同样是用于指定整个动画所经过的路径的。需要注意的是，values与path是互斥的，当values与path同时指定时，path会覆盖values，即values属性将被忽略。
 */
- (void)testMove
{
    //    CABasicAnimation  fromValue --> toValue
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    //CAKeyframeAnimation 可以有两个属性来执行动画 keyPath 和 values 它可以在多个值之间变化，而CABasicAnimation 只能在两个值之间执行动画
    //values与path是互斥的，当values与path同时指定时，path会覆盖values，即values属性将被忽略。
    
    anim.keyPath = @"position";
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(50, 100)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x*2-50, 100)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x*2-50, self.view.center.y*2-100)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(50, self.view.center.y*2-100)];
    NSValue *v5 = [NSValue valueWithCGPoint:CGPointMake(50, 100)];
    anim.values = @[v1, v2, v3, v4,v5];
    //    anim.path =
    //    anim.keyTimes = @[@(0.5), @(0.25), @(0.25)]; //每一帧用的时间
    
    anim.duration = 5.0;//动画执行时间
    anim.delegate = self;
    anim.repeatCount = MAXFLOAT;
    anim.removedOnCompletion = NO; //执行动画后不要移除
    anim.fillMode = kCAFillModeForwards; //保持最新
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.rectPoint.layer addAnimation:anim forKey:nil];
}


-(void)testMove2{
    //    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";//改变位置
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.duration = 2.0;
    
    anim.path = _path.CGPath;
    
    // 设置动画的执行节奏
    // kCAMediaTimingFunctionEaseInEaseOut : 一开始比较慢, 中间会加速,  临近结束的时候, 会变慢
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.repeatCount = MAXFLOAT;
    anim.delegate = self;
    
    [self.movePoint.layer addAnimation:anim forKey:nil];
    
}

-(void)layerAnimation
{
    //贝塞尔画圆
    _path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:120 startAngle:0 endAngle:M_PI*2 clockwise:NO];
    
    //初始化shapeLayer
    self.myShapeLayer = [CAShapeLayer layer];
    _myShapeLayer.frame = _movePoint.bounds;
    
    _myShapeLayer.strokeColor = [UIColor brownColor].CGColor;//边沿线色
    _myShapeLayer.fillColor = [UIColor clearColor].CGColor;//填充色
    
    _myShapeLayer.lineJoin = kCALineJoinMiter;//线拐点的类型
    _myShapeLayer.lineCap = kCALineCapSquare;//线终点
    
    //从贝塞尔曲线获得形状
    _myShapeLayer.path = _path.CGPath;
    
    //线条宽度
    _myShapeLayer.lineWidth = 5.0;
    
    //起始和终止
    _myShapeLayer.strokeStart = 0.0;
    _myShapeLayer.strokeEnd = 1.0;
    
    //将layer添加进图层
    [self.view.layer addSublayer:_myShapeLayer];
}


#pragma mark 动画的代理方法 动画开始的时候调用
- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animationDidStart");
}
#pragma mark 动画结束的时候调用
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animationDidStop");
}


#pragma mark-
#pragma mark- Getters && Setters

- (UIView *)movePoint {
    if (!_movePoint) {
        _movePoint = [[UIView alloc] init];
        _movePoint.backgroundColor = [UIColor redColor];
    }
    return _movePoint;
}

- (UIView *)rectPoint {
    if (!_rectPoint) {
        _rectPoint = [[UIView alloc] init];
        _rectPoint.backgroundColor = [UIColor orangeColor];
    }
    return _rectPoint;
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
    [self.view addSubview:self.movePoint];
    [self.view addSubview:self.startButton];
    [self.view addSubview:self.rectPoint];

    [_startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(50);
        make.right.mas_equalTo(self.view).mas_offset(-50);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(self.view).mas_offset(-40);
    }];
    [_movePoint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    [_rectPoint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
