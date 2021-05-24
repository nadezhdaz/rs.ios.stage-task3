#import "LevelOrderTraversal.h"

@interface Node : NSObject

@property (nonatomic, assign) NSNumber *value;
@property (nonatomic, strong) Node *left;
@property (nonatomic, strong) Node *right;

-(instancetype)initWithValue:(NSNumber*)data left:(Node*)left right:(Node*)right;
+(instancetype)buildTree:(NSMutableArray*)preorder;
+(NSArray*)constructLevelOrderTraversal:(Node*)node level:(NSInteger)level traversal:(NSMutableArray*)traversal;

@end

@implementation Node


-(instancetype)initWithValue:(NSNumber*)data left:(Node*)left right:(Node*)right {
    self = [super init];
    if (self) {
        _value = data;
        _left = left;
        _right = right;
    }
    return self;
}

+(instancetype)buildTree:(NSMutableArray*)preorder {
    if (preorder.count == 0) {
        return nil;
    }
    
    NSNumber *root = [preorder firstObject];
    [preorder removeObjectAtIndex:0];
    if ([root isEqual:[NSNull null]]) {
        return nil;
    } else {
        Node *left = [Node buildTree:preorder];
        Node *right = [Node buildTree:preorder];
        Node *tree = [[Node alloc] initWithValue:root left:left right:right];
        return tree;
    }
}

+(NSArray*)constructLevelOrderTraversal:(Node*)node level:(NSInteger)level traversal:(NSMutableArray*)traversal {
    if (!node) {
        return traversal;
    }
    
    if(traversal.count <= level){
        [traversal addObject:[NSMutableArray new]];
    }
    
    NSMutableArray* eachLevelArray = traversal[level];
    [eachLevelArray addObject:node.value];
    
    if(node.left){
        [self constructLevelOrderTraversal:node.left level:level + 1 traversal:traversal];
    }
    
    if(node.right){
        [self constructLevelOrderTraversal:node.right level:level + 1 traversal:traversal];
    }
    
    return traversal;
}

@end

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    if (tree.count == 0 || tree[0] == [NSNull null]) {
        return @[];
    }
    
    if (tree.count == 1) {
        return @[tree];
    }
    
    Node *restoredTree = [Node buildTree:[tree mutableCopy]];
    return [Node constructLevelOrderTraversal:restoredTree level:0 traversal:[NSMutableArray new]];
}
