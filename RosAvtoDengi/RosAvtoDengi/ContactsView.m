//
//  ContactsView.m
//  RosAvtoDengi
//
//  Created by Viktor on 08.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "ContactsView.h"

@interface ContactsView ()

@property (weak, nonatomic) IBOutlet UIView *barContactsView;
@property (weak, nonatomic) IBOutlet UIButton *buttonBackContactsView;


@end

@implementation ContactsView

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.buttonBackContactsView addTarget:self action:@selector(backButtonContacts) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) backButtonContacts {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
