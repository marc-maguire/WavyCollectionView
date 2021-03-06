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

//    CGFloat xValue = self.collectionView.frame.size.width/[superAttrs count];
    NSInteger count = 1;
    for (UICollectionViewLayoutAttributes *attribute in superAttrs) {
        UICollectionViewLayoutAttributes *newAttribute = [attribute copy];
        
        
        CGFloat randY = arc4random_uniform(self.collectionView.frame.size.height);
        
      
             newAttribute.frame = CGRectMake(newAttribute.frame.origin.x, randY, self.itemSize.width, self.itemSize.height * (randY/heightNeutral));
       
        //xValue * count
       
        count ++;
        [newAttrs addObject:newAttribute];
    }
    
    
//to make a linear scaling size from regular size at y = 0 to 4x the size at max y, use the below. runs into even more aggressive situation of items popping off screen.
//    CGFloat maxY = self.collectionView.frame.size.height;
//    CGFloat heightScale = 4;


//        CGFloat heightMultiplier = 1 + ((randY/maxY)*heightScale);
//        
//        newAttribute.frame = CGRectMake(xValue * count, randY, self.itemSize.width, self.itemSize.height * heightMultiplier);
//        
 
    
    return newAttrs;
    
}

@end
