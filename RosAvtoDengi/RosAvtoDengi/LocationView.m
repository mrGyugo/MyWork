//
//  LocationView.m
//  RosAvtoDengi
//
//  Created by Viktor on 08.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "LocationView.h"

@interface LocationView ()

@property (weak, nonatomic) IBOutlet UIView *barLocationView;
@property (weak, nonatomic) IBOutlet UIButton *buttonBackLocationView;


@end

@implementation LocationView

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.buttonBackLocationView addTarget:self action:@selector(backButtonLocation) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) backButtonLocation {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
