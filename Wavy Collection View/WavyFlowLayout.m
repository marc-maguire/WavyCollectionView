//
//  WavyFlowLayout.m
//  Wavy Collection View
//
//  Created by Marc Maguire on 2017-05-18.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "WavyFlowLayout.h"

@interface WavyFlowLayout ()

@end

@implementation WavyFlowLayout


-(void)prepareLayout {
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect];
    
    //need to copy attrs from super to avoid cached frame mismatch
    
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc]init];
    CGFloat heightNeutral = self.collectionView.frame.size.height/2;
    
    CGFloat xValue = self.collectionView.frame.size.width/[superAttrs count];
    NSInteger count = 1;
    for (UICollectionViewLayoutAttributes *attribute in superAttrs) {
        UICollectionViewLayoutAttributes *newAttribute = [attribute copy];
        
        
        CGFloat randY = arc4random_uniform(self.collectionView.frame.size.height);
        
      
             newAttribute.frame = CGRectMake(xValue * count, randY, self.itemSize.width, self.itemSize.height * (randY/heightNeutral));
       
        
       
        count ++;
        [newAttrs addObject:newAttribute];
    }
    
    
    
    return newAttrs;
    
}

@end
