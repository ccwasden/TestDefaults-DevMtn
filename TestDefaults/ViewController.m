//
//  ViewController.m
//  TestDefaults
//
//  Created by Chase Wasden on 1/14/15.
//  Copyright (c) 2015 Chase Wasden. All rights reserved.
//

#import "ViewController.h"
#import "Entry.h"

@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) NSNumber *myNumberObject;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Text field from beginning of class
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 200, 40)];
    [self.view addSubview:textField];
    textField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    textField.delegate = self;
    
    // this is how to handle values changing in text field AFTER shouldChangeCharactersInRange
    [textField addTarget:self action:@selector(onTextChange:) forControlEvents:UIControlEventValueChanged];
    
    
    
    
    
    
    
    // Some dictionaries and arrays review below
    
//    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
//    [self.view addSubview:label];

//    @0.25
//    [NSNumber numberWithFloat:0.25]

//    NSArray * arr = @[@"olive oil",@"1/4 cup"];
//
//    NSMutableDictionary * dict = @{@"IngredientName": @"olive oil",
//                            @"INgredientValue": @0.25}.mutableCopy;
//    [dict setValue:@"Black" forKey:@"IngredientColor"];
//
//
//
//    dict = @{@"IngredientName": @"olive oil",
//             @"INgredientValue": @"1/4 cup",
//             @"IngredientColor": @"Black"}.mutableCopy;
//
//
//    NSString * ingredient = dict[@"IngredientName"];
//    NSString * ingredient2 = arr[0];
//    NSString * ingredient3 = [dict valueForKey:@"IngredientName"];
    
    
    
    
    
    //Now creating and saving custom models
    // First, converting to dictionary
    
    Entry * myEntry = [Entry new];
    myEntry.title = @"New Entry";
    myEntry.content = @"Wrote an app";
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[myEntry toDictionary] forKey:@"MyEntry"];
    
    
    
    // Now, retrieve the dictionary out and convert to entry
    NSDictionary * entryDict = [defaults objectForKey:@"MyEntry"];
    Entry * entry = [Entry fromDictionary:entryDict];
    
//    OR
    Entry * entry2 = [Entry new];
    [entry2 updateWithDictionary:entryDict];
    
    
    
    
    
    
    
    
    // Below is how to deal with arrays of entries.. saving andthen retrieving
//
//    
//    Entry * myEntry2 = [Entry new];
//    myEntry2.title = @"Day 2";
//    myEntry2.content = @"Dev mtn";
//    
//    
//    
//    NSArray * entryArray = @[[myEntry toDictionary], [myEntry2 toDictionary]];
//
//    [defaults setValue:entryArray forKey:@"Entries"];
    
    
    
    
    
//    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
//    NSArray * entries = [defaults objectForKey:@"Entries"];
//    
//    NSMutableArray * entriesArr = [NSMutableArray array];
//    for (NSDictionary * entryDict in entries) {
//        Entry * entry = [Entry fromDictionary:entryDict];
//        [entriesArr addObject:entry];
//    }
    

    
    
    
    
    
    

    
    
}

-(void)onTextChange:(UITextField *)myField {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:myField.text forKey:@"MY_TEXT"];
    [defaults synchronize];
}

// This method misses the last character - saves text before returning YES (when the last character is added)

//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    
//    
//    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setValue:textField.text forKey:@"MY_TEXT"];
//    [defaults synchronize];
//    
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
