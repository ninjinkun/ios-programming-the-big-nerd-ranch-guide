//
//  DetailViewController.m
//  Homepwner
//
//  Created by Asano Satoshi on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Possession.h"
#import "ImageStore.h"
@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize possession = _possession;
@synthesize nameField = _nameField;
@synthesize serialNumberField = _serialNumberField;
@synthesize valueField = _valueField;
@synthesize dateField = _dateField;
@synthesize imageView = _imageView;

#pragma mark - Managing the detail item

- (void)setPossession:(id)possession
{
    if (_possession != possession) {
        _possession = possession;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.possession) {
        _nameField.text = _possession.possesionName;
        _serialNumberField.text = _possession.serialNumber;
        _valueField.text = [NSString stringWithFormat:@"%d", _possession.valueInDollars ];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        _dateField.text = [dateFormatter stringFromDate:_possession.dateCreated];
        self.navigationItem.title = _possession.possesionName;
        if (_possession.imageKey) {
            UIImage *image = [[ImageStore defaultImageStore] imageForKey:_possession.imageKey];
            _imageView.image = image;
        }
        else {
            _imageView.image = nil;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self configureView];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    _possession.possesionName = _nameField.text;
    _possession.serialNumber = _serialNumberField.text;
    _possession.valueInDollars = [_valueField.text intValue];
}

- (void)viewDidUnload
{
    [self setNameField:nil];
    [self setSerialNumberField:nil];
    [self setValueField:nil];
    [self setDateField:nil];
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)init
{
    self = [super initWithNibName:@"DetailViewController" bundle:nil];
    if (self) {

    }
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self init];
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;        
    }
    imagePicker.delegate = self;
    [self presentModalViewController:imagePicker animated:YES]; 

}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UIImagePickerControllerDeleagte

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    if (_possession.imageKey) {
        [[ImageStore defaultImageStore] deleteImageForKey:_possession.imageKey];
    }    
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef newUniqueIdString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
    _possession.imageKey = (__bridge NSString *)newUniqueIdString;
    CFRelease(newUniqueId);
    CFRelease(newUniqueIdString);

    [[ImageStore defaultImageStore] setImage:image forKey:_possession.imageKey];
    _imageView.image = image;
    [self dismissModalViewControllerAnimated:YES];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissModalViewControllerAnimated:YES];
}

@end
