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

@property(nonatomic, assign) PrintType pType;
@property(nonatomic, strong) BWBinaryNode *root;

@end

@implementation BinarySearchTree

- (void)printType:(PrintType)type {
	if (!self.root) {
		NSLog(@"二叉树为空");
		return;
	}
	self.pType = type;
	if (self.pType == PrintTypeThreeHeight) {
		int threeHeight = [self printThreeHeight:self.root];
		NSLog(@"树的高度：%d",threeHeight);
	}
	else {
		[self _printNode:_root];
	}
}

- (void)addValue:(int)value {
	if (!self.root) {
		self.root = [[BWBinaryNode alloc]initValue:value];
		return;
	}
	[self _addNode:self.root withValue:value];
}

- (void)clean {
	self.root = nil;
}

- (void)removeValue:(int)value {
	if (!self.root) {
		return;
	}
	[self _deleteNodel:self.root parentNode:nil withValue:value];
}

#pragma mark 私有方法
- (void)_deleteNodel:(BWBinaryNode *)node parentNode:(BWBinaryNode *)parent withValue:(int)value {
	// 删除根节点
	if (value == self.root.value) {
		self.root = nil;
		return;
	}
	// 找到当前节点
	if (value == node.value) {
		// 1. 当前节点已经是叶子节点了->直接删除。
		if (!node.left && !node.right) {
			if (parent.left.value == node.value) {
				parent.left = nil;
			}
			else {
				parent.right = nil;
			}
			return;
		}
		// 2. 左右都有
		if (node.left && node.right) {
			if (parent.left.value == node.value) {
				// 2.1 将自己的右子树提上来放在父节点的左边。
				BWBinaryNode *newNode = node.right;
				parent.left = newNode;
				// 2.2 将自己的左边放置在新节点的左边，到了这一步，当前的节点已经被删除掉。
				newNode.left = node.left;
			}
			// 自己在父节点的右边
			else {
				BWBinaryNode *newNode = node.right;
				// 2.3 放在父节点的右边。
				parent.right = newNode;
				newNode.left = node.left;
			}
			return;
		}
		// 3. 只有左边
		if (node.left) {
			// 3.1 在父节点的左边。
			if (parent.left.value == node.value) {
				parent.left = node.left;
			}
			// 3.2 在父节点的右边
			else {
				parent.right = node.left;
			}
			return;
		}
		// 4. 只有右边
		if (node.right) {
			// 4.1 在父节点的左边。
			if (parent.left.value == node.value) {
				parent.left = node.right;
			}
			// 4.2 在父节点的右边
			else {
				parent.right = node.right;
			}
			return;
		}
	}
	// 往左查找
	else if (value < node.value) {
		if (!node.left) {
			return;
		}
		[self _deleteNodel:node.left parentNode:node withValue:value];
	}
	// 往右查找
	else{
		if (!node.right) {
			return;
		}
		[self _deleteNodel:node.right parentNode:node withValue:value];
	}
}
- (void)_printNode:(BWBinaryNode *)node {
	switch (self.pType) {
	case PrintTypeFront: {
		if (node.left) {
			[self _printNode:node.left];
		}
		NSLog(@"value:%d",node.value);
		if (node.right) {
			[self _printNode:node.right];
		}
	}
	break;
	case PrintTypeIn: {
		NSLog(@"value:%d",node.value);
		if (node.left) {
			[self _printNode:node.left];
		}
		if (node.right) {
			[self _printNode:node.right];
		}
	}
	break;
	case PrintTypeLast: {
		if (node.right) {
			[self _printNode:node.right];
		}
		NSLog(@"value:%d",node.value);
		if (node.left) {
			[self _printNode:node.left];
		}
	}
	break;
	default:
		break;
	}
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

- (int)printThreeHeight:(BWBinaryNode *)node {
	if (!self.root) {
		return 0;
	}
	if (!node) {
		return 0;
	}
	int left = [self printThreeHeight:node.left];
	int right = [self printThreeHeight:node.right];

	return left > right?(left + 1):(right + 1);
}

@end
