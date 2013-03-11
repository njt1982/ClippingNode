ClippingNode
============

Provides a CCNode type which can be used for clipping the visible area of children

This is particularly useful in combination with CCMenuAdvanced.

This has been sourced from:
* http://www.cocos2d-iphone.org/forum/topic/32102
* http://www.cocos2d-iphone.org/forum/topic/19341
* http://www.learn-cocos2d.com/2011/01/cocos2d-gem-clippingnode/


Usage
======
```objectivec
CGRect menuBoundaryRect = CGRectMake(x, y, width, height);
ClippingNode *clipNode = [ClippingNode clippingNodeWithRect:menuBoundaryRect];
[clipNode addChild:menu];
[menu fixPosition];
[self addChild:clipNode];
```
