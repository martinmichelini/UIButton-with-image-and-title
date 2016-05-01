//
//  ViewController.m
//  Ui Button test
//
//  Created by Martin Michelini on 4/28/16.
//  Copyright © 2016 Martin Michelini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic) UILabel *buttonLabel;
@property (nonatomic) UIImageView *buttonImageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) CGRect originalTextViewFrame;
@property (nonatomic) NSTimeInterval animationDuration;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *buttonImage = [UIImage imageNamed:@"allergies"];
    self.buttonImageView = [[UIImageView alloc] initWithImage: buttonImage];
    [self.buttonImageView setFrame:CGRectMake((self.button.frame.size.width - buttonImage.size.width)/2, self.button.frame.size.height *1/4, buttonImage.size.width, buttonImage.size.height)];
    
    self.buttonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.button.frame.size.height *2/3, self.button.frame.size.width, 20)];
    [self.buttonLabel setTextAlignment:NSTextAlignmentCenter];
    [self.buttonLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:16]];
    self.buttonLabel.text = @"Allergies";
    
    self.buttonLabel.textColor = [UIColor darkGrayColor];
    [self.button addSubview:self.buttonImageView];
    [self.button addSubview:self.buttonLabel];
    
    
    self.textView.delegate = self;
    //register for keyboard notifications
    [self registerForKeyboardNotifications];
    
    self.originalTextViewFrame = self.textView.frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Create Notifications

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Scroller Movements

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWillShow:(NSNotification *)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    self.animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    CGRect newTextViewFrame = CGRectMake(self.originalTextViewFrame.origin.x, self.originalTextViewFrame.origin.y, self.originalTextViewFrame.size.width, self.originalTextViewFrame.size.height - kbSize.height);
    
    [UIView animateWithDuration:self.animationDuration animations:^{
        self.textView.frame =newTextViewFrame;
    }];
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
    [UIView animateWithDuration:self.animationDuration animations:^{
        self.textView.frame = self.originalTextViewFrame;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
