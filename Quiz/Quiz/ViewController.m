//
//  ViewController.m
//  Quiz
//
//  Created by Asano Satoshi on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize answerField;
@synthesize questionField;

// スニペットの説明する
- (id)initWithNibName:(NSString *)nibNameOrNilNil bundle:(NSBundle *)nibBundleOrNil 
{
    self = [super initWithNibName:nibNameOrNilNil bundle:nibBundleOrNil];
    if (self) {
        questions = [[NSMutableArray alloc] init];
        answers = [[NSMutableArray alloc] init];
        
        [questions addObject:@"What is 7 + 7?"];
        [answers addObject:@"14"];
        
        [questions addObject:@"What is the captal of Vermount?"];
        [answers addObject:@"Montpelier"];
        
        [questions addObject:@"From what is cognac made?"];
        [answers addObject:@"Grapes"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setAnswerField:nil];
    [self setQuestionField:nil];
    [super viewDidUnload];
}



- (IBAction)showQuestion:(id)sender {
    currentQuesitonIndex++;
    
    if (currentQuesitonIndex == questions.count) {
        currentQuesitonIndex = 0;        
    }
    NSString *question = [questions objectAtIndex:currentQuesitonIndex];
    NSLog(@"displaying quesiont: %@", question);
    
    questionField.text = question;
    
    answerField.text = @"???";
}

- (IBAction)showAnsewer:(id)sender {
    NSString *answer = [answers objectAtIndex:currentQuesitonIndex];
    answerField.text = answer;
}

- (void)dealloc {
    [answerField release];
    [questionField release];
    [questions release];
    [answers release];
    [super dealloc];
}
@end
