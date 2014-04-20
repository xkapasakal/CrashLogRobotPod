//
//  UIEvent+descriptionJson.m
//  Nomos
//
//  Created by User on 4/19/14.
//  Copyright (c) 2014 Intrasoft International S.A. All rights reserved.
//

#import "UIEvent+descriptionJson.h"
#import "JSONKit.h"

@implementation UIEvent (descriptionJson)
- (NSString*)crashLogRobotJsonDescription
{
    //    NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:
    //                          @"value1", @"key1", @"value2", @"key2", nil];
    NSDictionary* d_event = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                     [NSNumber numberWithDouble:self.timestamp], @"timestamp",
                                                     [NSNumber numberWithInt:self.type], @"type",
                                                     nil];

//    NSLog(@"%f", self.timestamp);
    //    typedef NS_ENUM(NSInteger, UIEventType) {
    //        UIEventTypeTouches,
    //        UIEventTypeMotion,
    //        UIEventTypeRemoteControl,
    //    };
//    NSLog(@"%d", self.type);
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
//    NSLog(@"%d", [self touchesForWindow:window].count);
    NSMutableArray* touches = [[NSMutableArray alloc] init];
    for (UITouch* touch in [self touchesForWindow:window]) {
        NSDictionary* d_touch = [NSDictionary dictionaryWithObjectsAndKeys:
                                                  [NSNumber numberWithInt:touch.tapCount], @"tapCount",
                                                  [NSNumber numberWithDouble:self.timestamp], @"timestamp",
                                                  [NSNumber numberWithInt:touch.phase], @"phase",
                                                  [touch.view.class description], @"view",
                                                  [NSNumber numberWithFloat:[touch locationInView:window].x], @"x",
                                                  [NSNumber numberWithFloat:[touch locationInView:window].y], @"y",
                                                  nil];
        [touches addObject:d_touch];
        //        NSLog(@"%lu", (unsigned long)touch.tapCount);
        //        NSLog(@"%f", touch.timestamp);
        //        NSLog(@"%d", touch.phase);
        //        NSLog(@"%@", touch.view);
        //        NSLog(@"%lu", (unsigned long)touch.gestureRecognizers.count);

//        for (UIGestureRecognizer* gestureRecognizer in touch.gestureRecognizers) {
//            NSLog(@"%@", gestureRecognizer);
//        }
//        NSLog(@"%f", [touch locationInView:window].x);
//        NSLog(@"%f", [touch locationInView:window].y);
    }

    [d_event setValue:touches
               forKey:@"touches"];
    return [d_event JSONString];
}
@end
