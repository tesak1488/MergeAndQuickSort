//
//  NSArray+Sorting.m
//  MergeQuickSort
//
//  Created by Kovalev_A on 21.10.17.
//  Copyright © 2017 Kovalev_A. All rights reserved.
//

#import "NSArray+Sorting.h"

@implementation NSArray (Sorting)

- (NSArray<id<Measurable>> *)mergeSortedArray
{
    if (self.count > 1) {
        NSUInteger middle = self.count / 2;
        NSArray <id<Measurable>> *leftArray = [self subarrayWithRange:NSMakeRange(0, middle)];
        NSArray <id<Measurable>> *rightArrat = [self subarrayWithRange:NSMakeRange(middle, self.count - middle)];
        return mergeArrays([leftArray mergeSortedArray], [rightArrat mergeSortedArray]);
    } else {
        return self;
    }
}

NSArray<id<Measurable>> *mergeArrays(NSArray <id<Measurable>> *leftArray, NSArray <id<Measurable>> *rightArray)
{
    NSMutableArray<id<Measurable>> *result = [NSMutableArray new];
    NSUInteger leftCounter = 0;
    NSUInteger rightCounter = 0;
    while (leftCounter < leftArray.count && rightCounter < rightArray.count) {
        id<Measurable> sortedObj = [leftArray[leftCounter] measure] < [rightArray[rightCounter] measure] ? leftArray[leftCounter++] : rightArray[rightCounter++];
        [result addObject:sortedObj];
    }
    while (leftCounter < leftArray.count) {
        [result addObject:leftArray[leftCounter++]];
    }
    while (rightCounter < rightArray.count) {
        [result addObject:rightArray[rightCounter++]];
    }
    return [result copy];
}

- (NSArray<id<Measurable>> *)quickSortedArray
{
    if (self.count <= 1) {
        return self;
    } else {
        NSInteger pivot = [self[arc4random() % self.count] measure];
        NSMutableArray *lessThenPivot = [NSMutableArray new];
        NSMutableArray *greaterThenPivot = [NSMutableArray new];
        for (id<Measurable> currentValue in self) {
            NSMutableArray *arrayToAddObject = [currentValue measure] < pivot ? lessThenPivot : greaterThenPivot;
            [arrayToAddObject addObject:currentValue];
        }
        return [[lessThenPivot quickSortedArray] arrayByAddingObjectsFromArray:[greaterThenPivot quickSortedArray]];
    }
}

@end
