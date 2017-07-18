//
//  ViewController.m
//  RestApiTryRequestReview
//
//  Copyright © 2017 Shaan Mirchandani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"response %@", response);
        
        NSLog(@"data %@", data);
        
        
     //   NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
     //   NSLog(@"%@", str);
        
        NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSLog(@"%@", dict);
        NSArray *array;
        array = [dict valueForKey:@"actors"];
        
        NSLog(@"%@",array);
        
        for (NSDictionary *dict in array) {
            NSLog(@"%@", [dict valueForKey:@"spouse"]);
        }
        
    }]resume];
}

@end
