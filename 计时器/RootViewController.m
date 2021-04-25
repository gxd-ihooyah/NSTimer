//
//  RootViewController.m
//  计时器
//
//  Created by Mac on 2021/3/17.
//  Copyright © 2021 Mac. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "CADisplayLinkViewController.h"
#import "GCDViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initRightButton];
    
    [self initButton];
}

-(void)initButton{
    
     CGFloat left = (self.view.frame.size.width - 150)/2;
     CGFloat top = (self.view.frame.size.height/2 - 140);
    
    NSArray * dataSource = @[@"NSTimer",@"CADisplayLink",@"GCD计时器"];
    
    for (NSInteger i = 0; i<dataSource.count; i++) {
        
        UIButton * item = [[UIButton alloc] initWithFrame:CGRectMake(left, top+i*50, 150, 40)];
        [item setTitle:dataSource[i] forState:0];
        [item setTitleColor:[UIColor redColor] forState:0];
        item.layer.cornerRadius = 5;
        item.layer.borderColor = [UIColor redColor].CGColor;
        item.layer.borderWidth = 2;
        
        item.tag = 10086 + i;
        [item addTarget:self action:@selector(itemClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:item];
        
    }
}

-(void)itemClick:(UIButton *)sender{
     
    NSInteger tag = sender.tag - 10086;
    
    switch (tag) {
        case 0:
        {
            ViewController *vc = [[ViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            
            break;
            
        case 1:{
            CADisplayLinkViewController * vc = [[CADisplayLinkViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 2:{
            GCDViewController * vc = [[GCDViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(void)initRightButton{
    UIButton * btn = [UIButton  buttonWithType:(UIButtonTypeSystem)];
    [btn setTitle:@"测试自定义" forState:0];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

@end
