//
//  CalculatorView.m
//  RosAvtoDengi
//
//  Created by Viktor on 08.10.15.
//  Copyright © 2015 Viktor. All rights reserved.
//

#import "CalculatorView.h"
#import "APINews.h"
#import "Parser.h"
#import "HeightForText.h"

@interface CalculatorView () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *barCalculatorView;
@property (weak, nonatomic) IBOutlet UIButton *buttonBackCalculatorView;
@property (strong, nonatomic) NSMutableArray * reviewsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation CalculatorView

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.reviewsArray = [[NSMutableArray alloc] init];
    
    [self getDataFromRoaAvto];
    

    
    
        [self.buttonBackCalculatorView addTarget:self action:@selector(backButtonCalculator) forControlEvents:UIControlEventTouchUpInside];
    



    
}

//Парсинг данных---------------------------------------
- (void) parsing: (id)response
{
    if ([response isKindOfClass:[NSArray class]]) {
        
        NSArray * array = (NSArray*) response;
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary * dict = (NSDictionary *) obj;
            
            Parser * parser = [[Parser alloc] init];
            [parser mts_setValuesForKeysWithDictionary:dict];
            
            //Параметры ширины текста одзыва----------------------------------------------
            NSString * text = parser.recall_text;
            text = [text stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
            
            NSString * name = parser.recall_name;

            
            HeightForText* heightForText = [HeightForText new];
            
            CGFloat textHeight = [heightForText getHeightForText:text textWith:self.view.frame.size.width - 20 withFont:[UIFont fontWithName:@"Century Gothic-Bold" size:15]];
            
            CGFloat nameHeight = [heightForText getHeightForText:name textWith:self.view.frame.size.width - 10  withFont:[UIFont fontWithName:@"Century Gothic-Bold" size:20]];
            
            parser.targetHeight = textHeight + nameHeight;
            parser.recall_text = text;
            parser.recall_name = name;
            
            [self.reviewsArray addObject:parser];
            
            self.tableView.backgroundColor = [UIColor clearColor];
            
            
        }];
        
        [self.tableView reloadData];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) backButtonCalculator {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.reviewsArray.count;
    
}
    



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    for (UIView* view in cell.subviews) {
        [view removeFromSuperview];
    }
    
    Parser* parser = [self.reviewsArray objectAtIndex:indexPath.row];
    
    [cell addSubview:[self getNameView:parser.recall_name height:17.f]];
    
    [cell addSubview:[self getTextView:parser.recall_text height:parser.targetHeight]];
    
    
    
    return cell;
    
}

//Текст отзыва--------------------------------------
- (UITextView*) getTextView: (NSString*) text height: (CGFloat) height
{
    UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 20, self.view.frame.size.width - 20, height)];
    textView.editable = NO;
    textView.scrollEnabled = NO;
    textView.font = [UIFont fontWithName:@"Century Gothic-Bold" size:15];
    textView.text = text;
    textView.backgroundColor = [UIColor clearColor];
    
    return textView;
}

- (UILabel*) getNameView: (NSString*) name height: (CGFloat) height {
    
    UILabel * labelName = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, self.view.frame.size.width - 20, height)];
    
    labelName.font = [UIFont fontWithName:@"Century Gothic-Bold" size:20];;
    labelName.text = name;
    
    return labelName;
}
//Ширина ячейки-------------------------------------
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    
    Parser* parser = [self.reviewsArray objectAtIndex:indexPath.row];
    
    return parser.targetHeight + 30;
}

- (void) getDataFromRoaAvto
{
    NSDictionary * params = [[NSDictionary alloc] initWithObjectsAndKeys:
                             [NSNumber numberWithInteger:5],@"count",
                             [NSNumber numberWithInteger: 0],@"offset",
                             nil];
    
    APINews * api = [APINews new];
    
    [api getDataFromServerWithMethod:params method:@"action=load_recall" complitionBlock:^(id response) {
        
        [self parsing:response];
        
        
        
    }];
    
}



@end
