//
//  ViewController.m
//  计时器
//
//  Created by Mac on 2021/3/17.
//  Copyright © 2021 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, assign) NSInteger time;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    
//    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"测试"];
//    [str addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:10]} range:NSMakeRange(0, str.length)];
//    
//    CGRect size = [str boundingRectWithSize:CGSizeMake(100, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil];
//    
//    CGRect x = self.view.frame;
    
    
    
    UIButton * centerButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 100)/2, (self.view.frame.size.height/2-100), 100, 40)];
//    centerButton.center = self.view.center;
    centerButton.backgroundColor= [UIColor redColor];
    [centerButton setTitle:@"暂停开始" forState:0];
    [self.view addSubview:centerButton];
    
      self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(centerButton.frame.origin.x, centerButton.frame.origin.y + 50, 100, 40)];
    //    endButton.center = self.view.center;
    self.timeLabel.layer.borderWidth = 2;
    self.timeLabel.layer.borderColor = [UIColor redColor].CGColor;
    self.timeLabel.text = @"60";
        [self.view addSubview:self.timeLabel];
    
    [centerButton addTarget:self action:@selector(centerClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
     UIButton * endButton = [[UIButton alloc] initWithFrame:CGRectMake(self.timeLabel.frame.origin.x, self.timeLabel.frame.origin.y + 50, 100, 40)];
    //    endButton.center = self.view.center;
        endButton.backgroundColor= [UIColor redColor];
        [endButton setTitle:@"结束" forState:0];
        [endButton addTarget:self action:@selector(endButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:endButton];
        
    
    
    self.time = 60;
    
    [self initTimer];
}

-(void)initTimer{
//    self.timer = [NSTimer  timerWithTimeInterval:1 target:self selector:@selector(printfDate) userInfo:nil repeats:YES];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
    }];
    [[NSRunLoop currentRunLoop ] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)centerClick:(UIButton *)sender{
    if (sender.selected) {
        self.timer.fireDate = [NSDate date];
    }else{
        self.timer.fireDate = [NSDate distantFuture];
        
    }
    sender.selected = ! sender.selected;
}
-(void)endButtonClick{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)starteButton{
  
}

-(void)printfDate{
//    NSLog(@"=====测试时间=====");
    self.timeLabel.text = [NSString stringWithFormat:@"%ld",self.time];
    self.time --;
    if (self.time <= 0) {
        [self  endButtonClick];
        self.timeLabel.text = @"点击重试";
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}

-(void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"释放了");
}


@end
