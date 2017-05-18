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

@end
