//
//  CalculatorView.m
//  RosAvtoDengi
//
//  Created by Viktor on 08.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "CalculatorView.h"
#import "AKPickerView.h"

@interface CalculatorView () <AKPickerViewDataSource, AKPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *barCalculatorView;
@property (weak, nonatomic) IBOutlet UIButton *buttonBackCalculatorView;
@property (weak, nonatomic) IBOutlet UIView *strokeView;

@property (nonatomic, strong) AKPickerView *pickerView;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation CalculatorView

- (void) viewDidLoad {
    [super viewDidLoad];
    
    //Свойтсва выделителя числа--------------------------
    self.strokeView.backgroundColor = [UIColor clearColor];
    self.strokeView.layer.borderColor = [UIColor blackColor].CGColor;
    self.strokeView.layer.borderWidth = 2.f;
    self.strokeView.layer.cornerRadius = 5.f;
    
    //Свойства пикера------------------------------------
    self.pickerView = [[AKPickerView alloc] initWithFrame:CGRectMake(-90, 235, 500, 100)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.pickerView];
    
    self.pickerView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    self.pickerView.highlightedFont = [UIFont fontWithName:@"HelveticaNeue" size:20];
    self.pickerView.interitemSpacing = 40.0;
    self.pickerView.fisheyeFactor = 0.001;
    self.pickerView.pickerViewStyle = AKPickerViewStyle3D;
    self.pickerView.maskDisabled = false;
    
    self.titles = @[@"1000", @"2000", @"3000", @"4000", @"5000",
                    @"6000", @"7000", @"8000", @"9000", @"10000",
                    @"11000", @"12000", @"13000", @"14000", @"15000",
                    @"16000", @"17000", @"18000", @"19000", @"20000",];
    
    [self.pickerView reloadData];
    
        [self.buttonBackCalculatorView addTarget:self action:@selector(backButtonCalculator) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - AKPickerViewDataSource

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
    return [self.titles count];
}

- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item
{
    return self.titles[item];
}


#pragma mark - AKPickerViewDelegate

- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item
{
    NSLog(@"%@", self.titles[item]);
}


#pragma mark - UIScrollViewDelegate

/*
 * AKPickerViewDelegate inherits UIScrollViewDelegate.
 * You can use UIScrollViewDelegate methods
 * by simply setting pickerView's delegate.
 *
 */

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Too noisy...
    // NSLog(@"%f", scrollView.contentOffset.x);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) backButtonCalculator {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
