
//
//  PageViewController.m
//  Lesson2
//
//  Created by Ри on 24.02.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController
static int page = 1;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.

    self.dataSource = self;
    [self setViewControllers:@[self.presentedViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}


- (UIViewController *)presentedViewController{
    return [self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    if(page == 1){
        page = 2;
        return [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    }if(page == 2){
        page = 3;
    return [self.storyboard instantiateViewControllerWithIdentifier:@"ThirdViewController"];
    }return nil;
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    if (page == 3) {
        page = 2;
        return [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];}
    if(page == 2){
        page = 1;
        return [self.storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
    }
    return nil;}
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
