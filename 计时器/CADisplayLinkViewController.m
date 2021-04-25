//
//  CADisplayLinkViewController.m
//  计时器
//
//  Created by Mac on 2021/3/17.
//  Copyright © 2021 Mac. All rights reserved.
//

#import "CADisplayLinkViewController.h"

@interface CADisplayLinkViewController ()

@property (nonatomic, strong) CADisplayLink *link;

@property (nonatomic, assign) BOOL pause;

@end

@implementation CADisplayLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.pause = NO;
    
    [self initCADisplayLink];
}

-(void)initCADisplayLink{
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkClick)];
    self.link.preferredFramesPerSecond = 1;
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:(NSRunLoopCommonModes)];
}

-(void)linkClick{
    NSLog(@"测试输出");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.link invalidate];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.pause = !self.pause;
    
    self.link.paused  = self.pause;
    
//    NSLog(@"bool%@",self.pause);
}

- (void)dealloc
{
    NSLog(@"释放了");
}

@end
