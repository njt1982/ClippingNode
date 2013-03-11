ClippingNode
============

Provides a CCNode type which can be used for clipping the visible area of children

This is particularly useful in combination with CCMenuAdvanced.

Usage
======
```
CGRect menuBoundaryRect = CGRectMake(x, y, width, height);
ClippingNode *clipNode = [ClippingNode clippingNodeWithRect:menuBoundaryRect];
[clipNode addChild:menu];
[menu fixPosition];
[self addChild:clipNode];
```
