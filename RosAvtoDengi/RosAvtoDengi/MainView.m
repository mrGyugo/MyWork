//
//  ViewController.m
//  RosAvtoDengi
//
//  Created by Viktor on 08.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "MainView.h"
#import "LocationView.h"
#import "CalculatorView.h"
#import "ContactsView.h"
#import "UIColor+HexColor.h"

@interface MainView ()
@property (weak, nonatomic) IBOutlet UIView* viewBarMainView; //Бар mainView

@property (weak, nonatomic) IBOutlet UIButton* buttonOurContacts; //Наши контакты
@property (weak, nonatomic) IBOutlet UIButton* buttonCalculator; //Калькулятор
@property (weak, nonatomic) IBOutlet UIButton* buttonLocation; //Месположение филиалов
@property (weak, nonatomic) IBOutlet UIView *downView; //Нижнее view

@end

@implementation MainView

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Параметры viewBarMainView----------------------------------------------
    self.viewBarMainView.backgroundColor = [UIColor colorWithHexString:@"434242"];
    
    //Параметры downView-----------------------------------------------------
    self.downView.backgroundColor = [UIColor colorWithHexString:@"434242"];
    

    //Параметры buttonOurContacts--------------------------------------------
    [self drawButtons:self.buttonOurContacts];
    [self.buttonOurContacts addTarget:self
                               action:@selector(actionButtonOurContacts)
                     forControlEvents:UIControlEventTouchUpInside];

    //Параметры buttonLocation-----------------------------------------------
    [self drawButtons:self.buttonLocation];
    [self.buttonLocation addTarget:self
                            action:@selector(actionButtonLocation)
                  forControlEvents:UIControlEventTouchUpInside];

    //Параметры buttonCalculator---------------------------------------------
    [self drawButtons:self.buttonCalculator];
    [self.buttonCalculator addTarget:self
                              action:@selector(actionButtonCalculator)
                    forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - buttonsMethods

//Рисуем из кнопок круги-----------------------------------------------------
- (void)drawButtons:(UIView*)button
{

    button.backgroundColor = [UIColor clearColor];
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.layer.borderWidth = 2.f;
    button.layer.cornerRadius = 50.f;
}
//Действие кнопки ButtonOurContacts------------------------------------------
- (void)actionButtonOurContacts
{

    ContactsView* detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Contacts"];
    [self.navigationController pushViewController:detail animated:YES];
}
//Действие кнопки ButtonLocation---------------------------------------------
- (void)actionButtonLocation
{

    LocationView* detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Location"];
    [self.navigationController pushViewController:detail animated:YES];
}
//Действие кнопки ButtonCalculator-------------------------------------------
- (void)actionButtonCalculator
{

    CalculatorView* detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Calculator"];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
