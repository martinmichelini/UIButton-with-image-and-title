//
//  ViewController.m
//  Ui Button test
//
//  Created by Martin Michelini on 4/28/16.
//  Copyright © 2016 Martin Michelini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic) UILabel *buttonLabel;
@property (nonatomic) UIImageView *buttonImageView;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
