//
//  ViewController.m
//  Lesson2
//
//  Created by Azat Almeev on 26.09.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "MainTableViewController.h"

@implementation MainTableViewController

static NSString *loadingCellIdentifier = @"LoadingTableViewCellIdentifier";

- (NSMutableArray *)items {
    if (!_items)
        _items = [NSMutableArray new];
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"LoadingTableViewCell" bundle:nil] forCellReuseIdentifier:loadingCellIdentifier];
    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    [refresh addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refresh];

}

- (void)didLoadNewData:(NSArray *)items {
    self.isLoading = NO;
    NSInteger offset = self.items.count * 4;
    [self.items addObjectsFromArray:items];
    NSMutableArray *indexPaths = [NSMutableArray new];
    for (NSInteger i = 0; i < items.count * 4; i++) {
        NSIndexPath *ip = [NSIndexPath indexPathForRow:i + offset inSection:0];
        [indexPaths addObject:ip];
    }
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)didFailToLoadDataWithError:(NSError *)error {
    self.isLoading = NO;
    self.didFail = YES;
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationAutomatic];
    NSLog(@"%@", error);
}

- (void)refresh:(UIRefreshControl *)refresh{
    [self loadDataUsingLastID:self.items.lastObject];
    [NSThread sleepForTimeInterval:5.0f];
    [refresh endRefreshing];

}
    
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return [indexPath section]==0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 1 ? !self.didFail : 4 * self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *basicIdentifier = @"BaseCellIdentifier";
    static NSString *subtitleIdentifier = @"subtitleCellIdentifier";
    
    if (indexPath.section == 1){
        return [tableView dequeueReusableCellWithIdentifier:loadingCellIdentifier];}
    UITableViewCell *cell;
    NSInteger index = indexPath.row / 4;
    if (indexPath.row % 4 == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:basicIdentifier];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", self.items[index]];
        return cell;
    }
    if(indexPath.row % 4 == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:subtitleIdentifier];
        cell.textLabel.text =[NSString stringWithFormat:@"%@",self.items[index]];
    }
    if(indexPath.row % 4 == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:@"RightDetail"];
        cell.textLabel.text =[NSString stringWithFormat:@"%@",self.items[index]];
    }
    if(indexPath.row % 4 == 3){
        cell = [tableView dequeueReusableCellWithIdentifier:@"Leftdetail"];
        cell.textLabel.text =[NSString stringWithFormat:@"%@",self.items[index]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && !self.isLoading) {
        [self loadDataUsingLastID:self.items.lastObject];
    }
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row / 4;
    [self.items removeObjectAtIndex:index];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:4 * index inSection:0], [NSIndexPath indexPathForRow:4 * index + 1 inSection:0], [NSIndexPath indexPathForRow:4 * index + 2 inSection:0], [NSIndexPath indexPathForRow:4 * index + 3 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
