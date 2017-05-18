//
//  ViewController.m
//  Wavy Collection View
//
//  Created by Marc Maguire on 2017-05-18.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ViewController.h"
#import "WavyFlowLayout.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic) UICollectionViewLayout *defaultLayout;
@property (nonatomic) WavyFlowLayout *customWavyFlowLayout;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.defaultLayout = self.myCollectionView.collectionViewLayout;
    self.customWavyFlowLayout = [[WavyFlowLayout alloc]init];
    [self.customWavyFlowLayout prepareLayout];
    self.myCollectionView.collectionViewLayout = self.customWavyFlowLayout;
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark Data Source Methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    
    
    
    return cell;
}


@end
