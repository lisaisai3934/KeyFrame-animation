//
//  ViewController.m
//  KeyFrame
//
//  Created by bytedance on 2021/12/16.
//

#import "ViewController.h"

@interface ViewController ()
//@property(nonatomic,strong)UIView *testView;
@property(nonatomic,strong)UIImageView *testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _testView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Image"]];
    _testView.frame =CGRectMake(0, 0, 50, 50);
//    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//    _testView.backgroundColor = [UIColor systemPinkColor];
    [self.view addSubview:_testView];
}
- (void)viewDidAppear:(BOOL)animated{
    //UIView动画
//    [self animationView];
    //关键帧动画
    [self keyFrame];
}
#pragma UIView动画
-(void)animationView{
    [self moveLeafWithOffset: (CGPoint){ 15, 80 } completion: ^(BOOL finished) {
        [self moveLeafWithOffset: (CGPoint){ 30, 105 } completion: ^(BOOL finished) {
            [self moveLeafWithOffset: (CGPoint){ 40, 110 } completion: ^(BOOL finished) {
                [self moveLeafWithOffset: (CGPoint){ 90, 80 } completion: ^(BOOL finished) {
                    [self moveLeafWithOffset: (CGPoint){ 80, 60 } completion: nil duration: 0.6];
                } duration: 1.2];
            } duration: 1.2];
        } duration: 0.6];
    } duration: 0.4];
    [UIView animateWithDuration: 4 animations: ^{
        self.testView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}
- (void)moveLeafWithOffset: (CGPoint)offset completion: (void(^)(BOOL finished))completion duration: (NSTimeInterval)duration{
    CGPoint center = _testView.center;
    center.x += offset.x;
    center.y += offset.y;
     [UIView animateWithDuration: duration delay: 0 options: UIViewAnimationOptionCurveLinear animations: ^{
         self.testView.center = center;
    } completion:completion];
}
#pragma 关键帧动画
-(void)keyFrame{
    [UIView animateKeyframesWithDuration: 4 delay: 0 options: UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        __block CGPoint center = self.testView.center;
        [UIView addKeyframeWithRelativeStartTime: 0 relativeDuration: 0.1 animations: ^{ self.testView.center = (CGPoint){ center.x + 15, center.y + 80 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.1 relativeDuration: 0.15 animations: ^{
            self.testView.center = (CGPoint){ center.x + 45, center.y + 185 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.25 relativeDuration: 0.3 animations: ^{
            self.testView.center = (CGPoint){ center.x + 90, center.y + 295 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.55 relativeDuration: 0.3 animations: ^{ self.testView.center = (CGPoint){ center.x + 180, center.y + 375 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0.85 relativeDuration: 0.15 animations: ^{
            self.testView.center = (CGPoint){ center.x + 260, center.y + 435 };
        }];
        [UIView addKeyframeWithRelativeStartTime: 0 relativeDuration: 1 animations: ^{ self.testView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    } completion: nil];
}
#pragma 隐藏顶部状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}
@end
