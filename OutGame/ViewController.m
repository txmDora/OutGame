//
//  ViewController.m
//  OutGame
//
//  Created by 田晓梦 on 2018/3/22.
//  Copyright © 2018年 田晓梦. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger n;//总人数
    NSInteger m;//第几个人出局
}
@property (weak, nonatomic) IBOutlet UITextField *peopleNumTextfield;
@property (weak, nonatomic) IBOutlet UITextField *outPeopleTagTextfield;
@property (weak, nonatomic) IBOutlet UILabel *livePeopleNumLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_peopleNumTextfield resignFirstResponder];
    [_outPeopleTagTextfield resignFirstResponder];
}
- (IBAction)playAction:(id)sender {
    NSMutableArray *numarray = [[NSMutableArray alloc] init];
    int n = 4, m = 4;
    int dead = 0, num = 0;
    for (int i = 1; i<=n; i++) {
        [numarray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for (int i= 1; ; i++) {
        if (i > n) {
            //如果大于总人数，我们就从头开始
            i = i%n;
        }
        
        if ([numarray[i-1] intValue] > 0){
            //如果当前这个人没有死，就报数
            num++;
        }
        if (m == num && dead != n-1){
            //如果当前这个人报的数等于m 并且没有已经死亡n-1个人
            num = 0;
            [numarray replaceObjectAtIndex:i-1 withObject:@"0"];
            dead++;
        } else if(m == num && dead == n-1){
            //如果这个人报数等于m，并且已经死了n-1个人，说明当前这个人就是最后的一个活着的了。
            NSLog(@"%@",numarray[i-1]);
            _livePeopleNumLabel.text = [NSString stringWithFormat:@"最后一个留下来的人是: %@号",numarray[i-1]];
            break;
        }
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
