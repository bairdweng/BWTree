//
//  BinarySearchTree.m
//  BWTree
//
//  Created by bairdweng on 2021/6/22.
//  二叉搜索树

#import "BinarySearchTree.h"

@implementation BWBinaryNode

- (instancetype)initValue:(int)value {
	self = [super init];
	if (self) {
		self.value = value;
	}
	return self;
}
@end

@interface BinarySearchTree ()

@property(nonatomic, strong) BWBinaryNode *root;

@end

@implementation BinarySearchTree


- (void)printAll {
	if (!_root) {
		NSLog(@"当前树为空");
		return;
	}
	[self _printNode:_root];
}

- (void)addValue:(int)value {
	if (!self.root) {
		self.root = [[BWBinaryNode alloc]initValue:value];
		return;
	}
	[self _addNode:self.root withValue:value];
}

- (BWBinaryNode *)_addNode:(BWBinaryNode *)node withValue:(int)value {
	if (value == node.value) {
		return node;
	}
	// 往左
	if (value < node.value) {
		// 继续找下去
		if (node.left) {
			node.left = [self _addNode:node.left withValue:value];
		}
		else {
			node.left = [[BWBinaryNode alloc]initValue:value];;
		}
	}
	// 往右
	else {
		// 继续找下去
		if (node.right) {
			node.right = [self _addNode:node.right withValue:value];
		}
		else {
			node.right = [[BWBinaryNode alloc]initValue:value];;
		}
	}
	return node;
}

#pragma mark 私有方法
- (void)_printNode:(BWBinaryNode *)node {
	NSLog(@"value:%d",node.value);
	if (node.left) {
		[self _printNode:node.left];
	}
	if (node.right) {
		[self _printNode:node.right];
	}
}

@end
