# 树的总结

##### 1. 二叉搜索树

  树是一种数据结构，主要的目的是为了数据的方便增删改查，普通的二叉搜索树，增删操作都是O(n)，为什么不是O(logn)，
  主要是因为二叉搜索树不是平衡树，极端条件下会退化成链表。假如新增的数据递增，那么这棵树将是个右撇子，反之是个左撇子。

##### 2. 如何手撸一个二叉搜索树呢？

1. 首先定义一个节点对象

   ```objective-c
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
   ```

2. 定义根节点

   ```objective-c
   @property(nonatomic, strong) BWBinaryNode *root;
   ```

3. 暴露几个方法

   ```objective-c
   // 添加值
   - (void)addValue:(int)value;
   // 打印所有
   - (void)printAll;
   ...
   ```

4. 添加节点

   1. 判断是否有根节点，没有根节点的话说明是第一次添加。

      ```objective-c
      if (!self.root) {
      		self.root = [[BWBinaryNode alloc]initValue:value];
      		return;
      	}
      ```

   2. 继续添加节点，小于当前的值，放在左边，反之放在右边。

      ```objective-c
      ...
      [self _addNode:self.root withValue:value];
      
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
      ```

      这里的核心的递归，先判断新节点应该放在左还是右，然后判断当前节点左子树是否存在，不存在直接赋值，存在则继续递归。

   3. 关于递归

      刚开始手撸的时候，总把递归的过程代入到脑中，一会就懵逼了。比较能掌握这个过程，还需循序渐进，判断递归结束条件，不要代入，你脑袋能压几个栈？ 
      
   4. 打印所有的值
      
      ```objective-c
      - (void)printAll {
      	if (!_root) {
      		NSLog(@"当前树为空");
      		return;
      	}
      	[self _printNode:_root];
      }
      
      - (void)_printNode:(BWBinaryNode *)node {
      	NSLog(@"value:%d",node.value);
      	if (node.left) {
      		[self _printNode:node.left];
      	}
      	if (node.right) {
      		[self _printNode:node.right];
      	}
      }
      ```
      
      
      
      

