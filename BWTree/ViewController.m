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
// 60,58,80,40,32
- (IBAction)insetData:(id)sender {
	NSArray *att = @[@(60),@(50),@(32),@(58),@(57),@(59),@(80),@(69)];
	[att enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
	         int value = [obj intValue];
	         [self.searchTree addValue:value];
	 }];
}
- (IBAction)clickOntheFront:(id)sender {
	[self.searchTree printType:PrintTypeFront];
}

- (IBAction)clickOntheMiddle:(id)sender {
	[self.searchTree printType:PrintTypeIn];
}

- (IBAction)clickOntheLast:(id)sender {
	[self.searchTree printType:PrintTypeLast];
}

- (IBAction)clickOntheThreeHeight:(id)sender {
	[self.searchTree printType:PrintTypeThreeHeight];
}

- (IBAction)clickClean:(id)sender {
	[self.searchTree clean];
}
- (IBAction)clickOntheDelete:(id)sender {
	// 随便删除个值
	[self.searchTree removeValue:200];
}

@end
