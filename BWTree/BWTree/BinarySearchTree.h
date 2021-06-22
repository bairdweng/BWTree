//
//  BinarySearchTree.h
//  BWTree
//
//  Created by bairdweng on 2021/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWBinaryNode : NSObject

- (instancetype)initValue:(int)value;
@property(nonatomic, assign) int value;
@property(nonatomic, strong) BWBinaryNode* left;
@property(nonatomic, strong) BWBinaryNode* right;

@end


@interface BinarySearchTree : NSObject

// 添加值
- (void)addValue:(int)value;
// 打印所有
- (void)printAll;

@end

NS_ASSUME_NONNULL_END
