//
//  ViewController.m
//  BWTree
//
//  Created by bairdweng on 2021/6/22.
//

#import "ViewController.h"
#import "BinarySearchTree.h"
@interface ViewController ()
@property(nonatomic, strong) BinarySearchTree *searchTree;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (BinarySearchTree *)searchTree {
	if (!_searchTree) {
		_searchTree = [BinarySearchTree new];
	}
	return _searchTree;
}

- (IBAction)insetData:(id)sender {
	NSArray *att = @[@(60),@(58),@(80),@(40),@(32)];
	[att enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
	         int value = [obj intValue];
	         [self.searchTree addValue:value];
	 }];
}
- (IBAction)clickOntheFront:(id)sender {
	[self.searchTree printType:PrintTypeFront];
}

- (IBAction)clickOntheMiddle:(id)sender {
	[self.searchTree printType:PrintTypeMiddle];
}

- (IBAction)clickOntheLast:(id)sender {
	[self.searchTree printType:PrintTypeLast];
}



@end
