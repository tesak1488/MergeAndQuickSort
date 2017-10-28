//
//  NSArray+Sorting.h
//  MergeQuickSort
//
//  Created by Kovalev_A on 21.10.17.
//  Copyright © 2017 Kovalev_A. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Measurable <NSObject>

- (NSInteger)measure;

@end

@interface NSArray (Sorting)

- (NSArray<id<Measurable>> *)mergeSortedArray;
- (NSArray<id<Measurable>> *)quickSortedArray;

@end
