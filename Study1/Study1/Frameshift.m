//
//  Frameshift.m
//  Study1
//
//  Created by Robert Rose on 5/7/14.
//

#import "Frameshift.h"

@implementation Frameshift

+(NSArray*)getSomeFrameshifts:(BOOL)gameTypeIsFrameshift difficulty:(BOOL)isHard firstClick:(int)firstClickIndex;
{
    Frameshift* f1;
    Frameshift* f2;
    Frameshift* f3;
    Frameshift* f4;
    Frameshift* f5;
    Frameshift* f6;
		
	if (gameTypeIsFrameshift) {
		if (isHard)
		{
			f1 = [[Frameshift alloc] initWithDetails: @"Charlie rambled on about his illness, how he'd lost his arm, where muskies used to be-- saying nothing, as intended."
												  t2: @"saying, nothing as intended"
				  ];
			f2 = [[Frameshift alloc] initWithDetails: @"The ring-necked pheasant continued to peer at the fox ears across the dimly lit council table while windows rattled in the howling winds."
												  t2: @"the dimly lit council"
				  ];
			f3 = [[Frameshift alloc] initWithDetails: @"Begin with dogwoods that change the first and so none side with golden mocker nut or rusty oaks, they vary--from lavendar to red and crimson."
												  t2: @"the fir stands on one side"
				  ];
			f4 = [[Frameshift alloc] initWithDetails: @"Soon, though folding races to include all hues and variations, growth ends."
												  t2: @"fold in graces"
				  ];
			f5 = [[Frameshift alloc] initWithDetails: @"Two kinds of surfaces meet here between terrains"
												  t2: @"bet we enter rains"
				  ];
			f6 = [[Frameshift alloc] initWithDetails: @"Henry Randall"
												  t2: @"hen reran it all"
				  ];
		}
		else
		{
			f1 = [[Frameshift alloc] initWithDetails: @"Charlie Siebert"
												  t2: @"char lies sea burnt"
				  ];
			f2 = [[Frameshift alloc] initWithDetails: @"combinations"
												  t2: @"come by nations"
				  ];
			f3 = [[Frameshift alloc] initWithDetails: @"Bea Pettiford"
												  t2: @"be a petty ford"
				  ];
			f4 = [[Frameshift alloc] initWithDetails: @"Hennessey"
												  t2: @"hen asea"
				  ];
			f5 = [[Frameshift alloc] initWithDetails: @"Ida Strawbridge"
												  t2: @"I had a straw bridge"
				  ];
			f6 = [[Frameshift alloc] initWithDetails: @"Henry Randall"
												  t2: @"Henry ran it all"
				  ];
		}
	}
	else
	{
		if (isHard)
		{
			f1 = [[Frameshift alloc] initWithDetails: @"It's always the right time to do the right thing.  \n\n(Who said it?)"
												  t2: @"MLK"
				  ];
			f2 = [[Frameshift alloc] initWithDetails: @"Root, though for the world cares nothing, thrives and labors underground, labors for the leaf-thick bough."
												  t2: @"Radnoti"
				  ];
			f3 = [[Frameshift alloc] initWithDetails: @"Whatever activity you find for your hand to do, do it with all your might for there's no activity, or planning, or knowledge, or wisdom in oblivion where we are all going."
												  t2: @"Ecclesiastes"
				  ];
			f4 = [[Frameshift alloc] initWithDetails: @"In the United States, the majority undertakes to supply a multitude of ready-made opinions for the use of individuals, who are thus relieved from the necessity of forming opinions of their own."
												  t2: @"Tocqueville"
				  ];
			f5 = [[Frameshift alloc] initWithDetails: @"Inside of one potato, there are mountains and rivers."
												  t2: @"Takahashi"
				  ];
			f6 = [[Frameshift alloc] initWithDetails: @"The thinner the data, the thicker the dogma."
												  t2: @"Crosson"
				  ];
		}
		else
		{
			f1 = [[Frameshift alloc] initWithDetails: @"Will we have might without compassion, power without morality, strength without sight?  We will overcome you with our capacity for suffering.  We will win you over.  Hatred is too heavy a burden.  \n\n(Who said it?)"
												  t2: @"MLK"
				  ];
			f2 = [[Frameshift alloc] initWithDetails: @"I have never let my schooling interfere with my education."
												  t2: @"Mark Twain"
				  ];
			f3 = [[Frameshift alloc] initWithDetails: @"Learning is a natural pleasure."
												  t2: @"Aristotle"
				  ];
			f4 = [[Frameshift alloc] initWithDetails: @"Thus we can reject everything else: religion, ideology, all received wisdom.  But we cannot escape the necessity of love and compassion."
												  t2: @"Dalai Lama"
				  ];
			f5 = [[Frameshift alloc] initWithDetails: @"A compliment is like a kiss through a veil."
												  t2: @"Hugo"
				  ];
			f6 = [[Frameshift alloc] initWithDetails: @"Then soule, live thou upon thy servant's loss, and let that pine to aggravate thy store; buy terms divine in selling hours of dross: Within be fed, without be rich no more..."
												  t2: @"Shakespeare"
				  ];
		}
    }
	
	[f1 setColor:[UIColor colorWithRed: 1 green: 1 blue: .5 alpha:1.0]];
	[f2 setColor:[UIColor colorWithRed: .5 green: 1 blue: 1 alpha:1.0]];
	[f3 setColor:[UIColor colorWithRed: 1 green: .5 blue: 1 alpha:1.0]];
	[f4 setColor:[UIColor colorWithRed: .8 green: 1 blue: .5 alpha:1.0]];
	[f5 setColor:[UIColor colorWithRed: .5 green: .5 blue: .8 alpha:1.0]];
	[f6 setColor:[UIColor colorWithRed: 1 green: 0 blue: .5 alpha:1.0]];

	NSArray* frameshifts = [NSArray arrayWithObjects: f1, f2, f3, f4, f5, f6, nil];
	NSNumber* no = [NSNumber numberWithBool:NO];
	NSMutableArray* alreadyUsed = [NSMutableArray arrayWithObjects: no, no, no, no, no, no, no, no, no, no, no, no, nil];
	
	srand([[NSDate date] timeIntervalSince1970]);
	
	[f1 setButtonIndex1:firstClickIndex]; //always start with arm or king
	[alreadyUsed replaceObjectAtIndex: firstClickIndex withObject:[NSNumber numberWithBool:YES]];
	
	[f1 setButtonIndex2:[self getRandomValue: alreadyUsed]];
	[f2 setButtonIndex1:[self getRandomValue: alreadyUsed]];
	[f2 setButtonIndex2:[self getRandomValue: alreadyUsed]];
	[f3 setButtonIndex1:[self getRandomValue: alreadyUsed]];
	[f3 setButtonIndex2:[self getRandomValue: alreadyUsed]];
	[f4 setButtonIndex1:[self getRandomValue: alreadyUsed]];
	[f4 setButtonIndex2:[self getRandomValue: alreadyUsed]];
	[f5 setButtonIndex1:[self getRandomValue: alreadyUsed]];
	[f5 setButtonIndex2:[self getRandomValue: alreadyUsed]];
	[f6 setButtonIndex1:[self getRandomValue: alreadyUsed]];
	[f6 setButtonIndex2:[self getRandomValue: alreadyUsed]];
	
    return frameshifts;
}

+(int)getRandomValue:(NSMutableArray*)alreadyUsed
{
	int val = arc4random() % 12;
	
	if ([[alreadyUsed objectAtIndex:val] boolValue])
	{
		return [self getRandomValue: alreadyUsed];
	}
	else
	{
		[alreadyUsed replaceObjectAtIndex: val withObject:[NSNumber numberWithBool:YES]];
		
		return val;
	}
}

-(id)initWithDetails:(NSString*)defaultText1 t2:(NSString*)defaultText2
{
    self = [super init];
    if(self)
    {
        self.text1 = defaultText1;
        self.text2 = defaultText2;
		self.revealed = false;
    }
    
    return self;
}

@end
