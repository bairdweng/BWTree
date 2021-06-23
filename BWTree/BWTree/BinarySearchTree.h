//
//  BinarySearchTree.h
//  BWTree
//
//  Created by bairdweng on 2021/6/22.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
	// 前置排序
	PrintTypeFront,
	// 中置排序
	PrintTypeIn,
	// 后序排序
	PrintTypeLast,
	// 树的高度
	PrintTypeThreeHeight,
} PrintType;


@interface BWBinaryNode : NSObject

- (instancetype)initValue:(int)value;
@property(nonatomic, assign) int value;
@property(nonatomic, strong) BWBinaryNode* left;
@property(nonatomic, strong) BWBinaryNode* right;

@end


@interface BinarySearchTree : NSObject

/// 添加值
- (void)addValue:(int)value;
/// 前/中/后排序
- (void)printType:(PrintType)type;
/// 删除所有
- (void)clean;
/// 删除一个值
/// @param value 值
- (void)removeValue:(int)value;

@end


