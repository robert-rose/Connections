//
//  FlipCardViewController.m
//  Study1
//
//  NOTE THIS IS NOT INTENDED AS AN EXAMPLE OF HOW TO ARCHITECT
//      AN APPLICATION.  IT'S A SERIES OF HACKS FOR
//      SIMPLICITY IN UNDERSTANDING THE LANGUAGE AND UI MECHANICS.
//
//  Created by SOMEONE on 5/5/14.
//

#import "FlipCardViewController.h"
#import "Frameshift.h"

@interface FlipCardViewController ()
@property UIButton* currentlyFlipped;
@property int currentlyFlippedIndex;
@property Frameshift* currentlyFlippedFrameshift;
@property NSArray* allButtons;
@property UIColor* colorOfBackOfCard;
@property NSArray* frameshifts;
@end

@implementation FlipCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidLoad];
    
    self.colorOfBackOfCard = self.b0.backgroundColor;
	self.allButtons = [NSArray arrayWithObjects: self.b0, self.b1, self.b2, self.b3, self.b4, self.b5, self.b6, self.b7, self.b8, self.b9, self.b10, self.b11, nil];
	
	[self resetGame];
}

-(void)resetGame
{
	self.currentlyFlipped = nil;
	self.currentlyFlippedFrameshift = nil;

    for(id btn in self.allButtons)
    {
        [btn setBackgroundColor: self.colorOfBackOfCard];
        [btn setTitle:@"" forState:UIControlStateNormal];
	}
	
	self.frameshifts = nil;
}

-(int)getButtonIndex:(UIButton*)forButton
{
    int i = 0;
    for(id btn in self.allButtons)
    {
        if (btn == forButton)
        {
            return i;
        }
        i++;
    }
    
    return -1;
}

-(Frameshift*)getFrameshiftByButtonIndex:(int)forIndex
{
    for(id frameshift in self.frameshifts)
    {
        if (([frameshift buttonIndex1] == forIndex) || ([frameshift buttonIndex2] == forIndex))
        {
            return frameshift;
        }
    }
    
    return nil;
}

- (IBAction)gameTypeValueChanged:(id)sender {
	[self resetGame];
	
	[[self difficulty] setOn:NO];
}

- (IBAction)difficultyValueChanged:(id)sender {
	[self resetGame];
}

- (IBAction)cardTouchUp:(id)sender {
    UIButton* btn = (UIButton*)sender;

    int btnIndex = [self getButtonIndex:btn];
	
	if (self.frameshifts == nil)
	{
		self.frameshifts = [Frameshift getSomeFrameshifts:[[self gameType] isOn] difficulty:[[self difficulty] isOn] firstClick:(int)btnIndex];
	}
	
	Frameshift* f = [self getFrameshiftByButtonIndex: btnIndex];

	if (f.revealed) return;
	
    if (btn == self.currentlyFlipped)
    {
        [btn setBackgroundColor: self.colorOfBackOfCard];
        [btn setTitle:@"" forState:UIControlStateNormal];
        self.currentlyFlipped = nil;
        self.currentlyFlippedIndex = -1;
		self.currentlyFlippedFrameshift = nil;
    }
    else
    {
        if (self.currentlyFlipped)
        {
			if (f == self.currentlyFlippedFrameshift)
            {
				f.revealed = true;
				[self.currentlyFlipped setBackgroundColor: [f color]];
				self.currentlyFlipped = nil;
				self.currentlyFlippedIndex = -1;
				self.currentlyFlippedFrameshift = nil;
			}
			else
			{
				[self.currentlyFlipped setBackgroundColor: self.colorOfBackOfCard];
				[self.currentlyFlipped setTitle:@"" forState:UIControlStateNormal];
			}
        }
		
		NSString* text;
		
		if ([f buttonIndex1] == btnIndex)
        {
            text = [f text1];
        }
		else
        {
            text = [f text2];
        }
        
        [btn setTitle:text forState:UIControlStateNormal];
		
		if (f.revealed)
		{
			[btn setBackgroundColor: [f color]];
		}
		else
		{
			[btn setBackgroundColor: [UIColor whiteColor]];
		
			self.currentlyFlipped = btn;
			self.currentlyFlippedIndex = btnIndex;
			self.currentlyFlippedFrameshift = f;
		}
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
