//
//  ClippingNode.m
//

#import "ClippingNode.h"


@interface ClippingNode (PrivateMethods)
-(void) deviceOrientationChanged:(NSNotification*)notification;
@end

@implementation ClippingNode

-(id) initWithRect:(CGRect) rect {
    if ( (self = [super init]) ) {
        [self setClippingRegion:rect];
    }
    return self;
}

+(id) clippingNodeWithRect:(CGRect) rect {
    return [[self alloc] initWithRect:rect];
}

-(CGRect) clippingRegion {
    return clippingRegionInNodeCoordinates;
}

-(void) setClippingRegion:(CGRect)region {
    // keep the original region coordinates in case the user wants them back unchanged
    clippingRegionInNodeCoordinates = region;
    self.contentSize = clippingRegionInNodeCoordinates.size;
    
    // convert to retina coordinates if needed
    region = CC_RECT_POINTS_TO_PIXELS(region);
    
    // respect scaling
    clippingRegion = CGRectMake(region.origin.x * scaleX_, region.origin.y * scaleY_,
                                region.size.width * scaleX_, region.size.height * scaleY_);
}

-(void) setScale:(float)newScale {
    [super setScale:newScale];
    [self setClippingRegion:clippingRegionInNodeCoordinates];
}

-(void) visit {
    glEnable(GL_SCISSOR_TEST);
    CGPoint worldPosition = [self convertToWorldSpace:CGPointZero];
    const CGFloat s = [[CCDirector sharedDirector] contentScaleFactor];
    glScissor(clippingRegion.origin.x + (worldPosition.x * s),
              clippingRegion.origin.y + (worldPosition.y * s),
              clippingRegion.size.width,
              clippingRegion.size.height);
    
    [super visit];
    
    glDisable(GL_SCISSOR_TEST);
}

@end

