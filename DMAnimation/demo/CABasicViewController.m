//
//  CABasicViewController.m
//  DMAnimation
//
//  Created by 张炯 on 2017/8/3.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "CABasicViewController.h"
#import <Masonry/Masonry.h>

@interface CABasicViewController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>

@property (nonatomic, strong) UIView *animationView;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UILabel *aniLabel;
@property (nonatomic, strong) NSArray *animationArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSString *animationType;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation CABasicViewController

#pragma mark-
#pragma mark- View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animationArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"customCell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.animationArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _animationType = _animationArray[indexPath.row];
}



#pragma mark-
#pragma mark- Event response


/* CATransform3D Key Paths : (example)transform.rotation.z
rotation.x
rotation.y
rotation.z
rotation 旋轉
scale.x
scale.y
scale.z
scale 缩放
translation.x
translation.y
translation.z
translation 平移
CGPoint Key Paths : (example)position.x
x
y
CGRect Key Paths : (example)bounds.size.width
origin.x
origin.y
origin
size.width
size.height
size
opacity
backgroundColor
cornerRadius
borderWidth
contents
Shadow Key Path:
shadowColor
shadowOffset
shadowOpacity
shadowRadius
*/

- (NSArray *)animationArray {
    if (!_animationArray) {
        _animationArray = [NSArray arrayWithObjects:
                           @"transform.rotation.x",
                           @"transform.rotation.y",
                           @"transform.rotation.z",
                           @"transform.scale.x",
                           @"transform.scale.y",
                           @"transform.scale",
                           @"transform.translation.x",
                           @"transform.translation.y",
                           @"transform.translation.z",
                           @"bounds.origin.x",
                           @"bounds.origin.y",
                           @"bounds.origin",
                           @"bounds.size.width",
                           @"bounds.size.height",
                           @"bounds.size",
                           @"bounds.scale.x",
                           @"bounds.scale.y",
                           @"bounds.scale",
                           @"opacity",
                           @"backgroundColor",
                           @"cornerRadius",
                           @"borderWidth",
                           @"contents",
                           @"shadowColor",
                           @"shadowOffset",
                           @"shadowOpacity",
                           @"shadowRadius",
                           @"position.x",
                           @"position.y",
                           @"position",nil];
    }
    return _animationArray;
}

- (void)startAnimation:(UIButton *)button {
    [self.animationView.layer removeAllAnimations];
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:_animationType];
    
    
    if ([_animationType hasPrefix:@"transform.rotation"]) {
        //transform.rotation
        ani.fromValue = [NSNumber numberWithFloat:0];
        ani.toValue = [NSNumber numberWithFloat:2*M_PI];
    }else if ([_animationType hasPrefix:@"transform.scale"]) {
        //transform.scale
        ani.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
        ani.toValue = [NSNumber numberWithFloat:1.5]; // 结束时的倍率
    }else if ([_animationType hasPrefix:@"transform.translation"]) {
        //transform.translation  终点设定
        ani.toValue = [NSNumber numberWithFloat:-200];
    }else if ([_animationType hasPrefix:@"bounds.origin"]) {
        //bounds.origin
        if ([_animationType isEqualToString:@"bounds.origin"]) {
            ani.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 50)];
        }else{
            ani.toValue = [NSNumber numberWithFloat:-100]; // 终了点
        }
    }else if ([_animationType hasPrefix:@"bounds.size"]) {
        //bounds.size
        if ([_animationType isEqualToString:@"bounds.size"]) {
            ani.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 50)];
        }else{
            ani.toValue = [NSNumber numberWithFloat:200]; // 终了点
        }
    }else if ([_animationType hasPrefix:@"bounds.scale"]) {
        //bounds.scale
        ani.toValue = [NSNumber numberWithFloat:1.5]; // 结束时的倍率
    }else if ([_animationType hasPrefix:@"opacity"]) {
        //opacity
        ani.toValue = [NSNumber numberWithFloat:0.2];
    }else if ([_animationType hasPrefix:@"backgroundColor"]) {
        //backgroundColor
        //ani.fromValue = [UIColor redColor];
        ani.toValue = (__bridge id _Nullable)([UIColor brownColor].CGColor);
    }else if ([_animationType hasPrefix:@"cornerRadius"]) {
        //cornerRadius
        ani.toValue = [NSNumber numberWithFloat:60];
    }else if ([_animationType hasPrefix:@"contents"]) {
        //cornerRadius
        ani.toValue = (__bridge id _Nullable)([UIImage imageNamed:@"to.jpg"].CGImage);
        //_imgView.image = ;
    }else if ([_animationType hasPrefix:@"borderWidth"]) {
        //borderWidth
        ani.toValue = [NSNumber numberWithFloat:6];
    }else if ([_animationType hasPrefix:@"position"]) {
        //position
        if ([_animationType isEqualToString:@"position"]) {
            ani.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 50)];
        }else{
            ani.toValue = [NSNumber numberWithFloat:100];
        }
    }
    
    
    
    
    ani.delegate = self;
    
    
//
//    // 终点设定
//    ani.toValue = [NSNumber numberWithFloat:self.view.center.x];
    
    
//    ani.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 50)];
    
//    ani.toValue = [NSNumber numberWithFloat:5];
//    
//    
//    
    ani.removedOnCompletion = NO;
    ani.autoreverses = YES;
    ani.fillMode = kCAFillModeForwards;
    ani.repeatCount = MAXFLOAT;
    ani.duration = 1;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    if ([_animationType hasPrefix:@"contents"]) {
        [self.imgView.layer addAnimation:ani forKey:@"PostionAni"];
    }else{
        [self.animationView.layer addAnimation:ani forKey:@"PostionAni"];
    }
    
    

}

/**
 * 动画开始时
 */
- (void)animationDidStart:(CAAnimation *)theAnimation
{
    NSLog(@"begin");
}

/**
 * 动画结束时
 */
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    NSLog(@"end");
}

#pragma mark-
#pragma mark- Private Methods




#pragma mark-
#pragma mark- Getters && Setters

- (UIView *)animationView {
    if (!_animationView) {
        _animationView = [[UIView alloc] init];
        _animationView.backgroundColor = [UIColor redColor];
    }
    return _animationView;
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

- (UILabel *)aniLabel {
    if (!_aniLabel) {
        _aniLabel = [[UILabel alloc] init];
        _aniLabel.text = @"Animation";
        _aniLabel.textColor = [UIColor whiteColor];
        _aniLabel.font = [UIFont systemFontOfSize:20.0];
        _aniLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _aniLabel;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"from.jpg"]];
    }
    return _imgView;
}

#pragma mark-
#pragma mark- SetupConstraints

- (void)setupSubviewsContraints{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.animationView];
    [self.view addSubview:self.startButton];
    [self.animationView addSubview:self.imgView];
    [self.animationView addSubview:self.aniLabel];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(360);
    }];
    [_startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(50);
        make.right.mas_equalTo(self.view).mas_offset(-50);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(self.view).mas_offset(-40);
    }];
    [_animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_startButton.mas_top).mas_offset(-60);
        
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(120);
    }];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(_animationView);
    }];
    [_aniLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(_animationView);
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
