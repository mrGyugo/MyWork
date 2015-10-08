//
//  CompanyNewsView.m
//  RosAvtoDengi
//
//  Created by Viktor on 08.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "CompanyNewsView.h"

@interface CompanyNewsView ()

@property (weak, nonatomic) IBOutlet UIView *barCompanyNewsView; //Бар CompanyNewsView

@property (weak, nonatomic) IBOutlet UIButton *buttonBackCompanyNewsView; //Кнопка возврата

@end

@implementation CompanyNewsView

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self.buttonBackCompanyNewsView addTarget:self action:@selector(backButtonNews) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) backButtonNews {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
