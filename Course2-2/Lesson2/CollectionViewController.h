//
//  CollectionViewController.h
//  Lesson2
//
//  Created by Ри on 24.02.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingCollectionViewController.h"

@interface CollectionViewController : LoadingCollectionViewController
@property (nonatomic) NSMutableArray *items;
@property BOOL isLoading;
@property BOOL didFail;
@end
