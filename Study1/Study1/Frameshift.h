//
//  Frameshift.h
//  Study1
//
//  Created by Robert Rose on 5/7/14.
//

#import <Foundation/Foundation.h>

@interface Frameshift : NSObject
@property NSString* text1;
@property int buttonIndex1;
@property NSString* text2;
@property int buttonIndex2;
@property UIColor* color;
@property bool revealed;

+(NSArray*)getSomeFrameshifts:(BOOL)gameTypeIsFrameshift difficulty:(BOOL)isHard firstClick:(int)firstClickIndex;

-(id)initWithDetails:(NSString*)defaultText1 t2:(NSString*)defaultText2;

@end
