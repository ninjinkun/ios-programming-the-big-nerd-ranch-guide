//
//  ViewController.h
//  Quiz
//
//  Created by Asano Satoshi on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSInteger currentQuesitonIndex;
    NSMutableArray *questions;
    NSMutableArray *answers;
}
@property (retain, nonatomic) IBOutlet UILabel *answerField;
@property (retain, nonatomic) IBOutlet UILabel *questionField;
- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnsewer:(id)sender;

@end
