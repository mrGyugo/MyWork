//
//  CalculatorView.m
//  RosAvtoDengi
//
//  Created by Viktor on 08.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "CalculatorView.h"

@interface CalculatorView ()

@property (weak, nonatomic) IBOutlet UIView *barCalculatorView;
@property (weak, nonatomic) IBOutlet UIButton *buttonBackCalculatorView;

@end

@implementation CalculatorView

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.buttonBackCalculatorView addTarget:self action:@selector(backButtonCalculator) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) backButtonCalculator {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
