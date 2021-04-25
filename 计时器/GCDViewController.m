//
//  GCDViewController.m
//  计时器
//
//  Created by Mac on 2021/3/17.
//  Copyright © 2021 Mac. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initGCD];
}

-(void)initGCD{
    __block NSInteger time = 10; //倒计时时间
      dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        
        if (time <= 0) {
            dispatch_cancel(timer);
            
        }else{
            time--;
            NSLog(@"=====%ld======",time);
        }
        
    });
    dispatch_resume(timer);
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
