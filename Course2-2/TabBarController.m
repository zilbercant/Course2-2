//
//  TabBarController.m
//  Lesson2
//
//  Created by Ри on 24.02.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnToTabBarController:(UIStoryboardSegue *)sender {
    
}
@end
