//
//  ClippingNode.h
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

/** Restricts (clips) drawing of all children to a specific region. */
@interface ClippingNode : CCNode {
    CGRect clippingRegionInNodeCoordinates;
    CGRect clippingRegion;
}

+(id) clippingNodeWithRect:(CGRect) rect;

@property (nonatomic) CGRect clippingRegion;

@end