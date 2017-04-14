//
//  ViewController.m
//  ffmpegDemo
//
//  Created by 范云飞 on 2017/4/11.
//  Copyright © 2017年 范云飞. All rights reserved.
//

#import "ViewController.h"
#import "KxMovieViewController.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * movie = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 60, 50)];
    movie.backgroundColor = [UIColor redColor];
    [movie addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:movie];
}

- (void)play:(UIButton *)play{
    NSString *path = @"http://baobab.wdjcdn.com/14571455324031.mp4";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    // increase buffering for .wmv, it solves problem with delaying audio frames
    if ([path.pathExtension isEqualToString:@"wmv"])
        parameters[KxMovieParameterMinBufferedDuration] = @(5.0);
    
    // disable deinterlacing for iPhone, because it's complex operation can cause stuttering
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        parameters[KxMovieParameterDisableDeinterlacing] = @(YES);
    
    KxMovieViewController *vc = [KxMovieViewController movieViewControllerWithContentPath:path
                                                                               parameters:parameters];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
