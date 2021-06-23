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
      
      
      
##### 3. 删除二叉树

  个人认为这个是比较关键的点。

1. 第一种情况，删除的节点是根节点，这个是最简单的。

   ```objective-c
   	// 删除根节点
   	if (value == self.root.value) {
   		self.root = nil;
   	}
   ```

2. 删除的节点没有子节点，也就是说当前的节点是叶子节点。

   2.1 在这里首先要判断当前节点在父节点的左边还是右边，知道后直接将其置为空即可。

   ```objective-c
   ···
   if (!node.left && !node.right) {
     if (parent.left.value == node.value) {
       parent.left = nil;
     }
     else {
       parent.right = nil;
     }
     return;
   }
   ...
   ```
   
3. 当前节点左右都有子节点，这种情况相对复杂

   3.1 首先还是需要判断在父节点的位置，方便将右子树提取上来。

   ```objective-c
   // 左边
   if (parent.left.value == node.value) {
     ...
   }
   // 右边
   else {
     ...
   }
   ```

   3.2 将右子树提取到自己当前的位置，上一步已经知道自己在原来父子树的左边还是右边。

   ```objective-c
   // 左边
   if (parent.left.value == node.value) {
     // 2.1 将自己的右子树提上来放在父节点的左边。
     BWBinaryNode *newNode = node.right;
     parent.left = newNode;
     // 2.2 将自己的左边放置在新节点的左边，到了这一步，当前的节点已经被删除掉。
     newNode.left = node.left;
   }
   // 右边
   else {
     BWBinaryNode *newNode = node.right;
     // 2.3 放在父节点的右边。
     parent.right = newNode;
     newNode.left = node.left;
   }
   ```

4. 节点只有左子树，直接将左子树替换上来自己的位置。

   ```objective-c
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
   ```

5. 节点只有右子树，直接将右子树替换上来自己的位置。

   ```objective-c
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
   ```

   以上已经包含了所有处理的情况，待续...

