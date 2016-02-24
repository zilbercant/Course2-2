//
//  LoadingCollectionViewController.h
//  Lesson2
//
//  Created by Ри on 24.02.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingCollectionViewController : UICollectionViewController
- (void)loadDataUsingLastID:(NSNumber *)lastId;
- (void)didLoadNewData:(NSArray *)items;
- (void)didFailToLoadDataWithError:(NSError *)error;
@end
