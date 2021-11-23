//
//  ViewController.m
//  RACdemo
//
//  Created by 曹国盛 on 2021/11/18.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstTF;
@property (weak, nonatomic) IBOutlet UITextField *secondTF;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self.firstTF rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"\nfirstTF\n内容-->%@\n长度-->%ld", x, x.length);
    }];
    
    [[self.secondTF rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"\nsecondTF\n内容-->%@\n长度-->%ld", x, x.length);
    }];
    
    [[self.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"点击了按钮");
    }];
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        //发送信息
//       [subscriber sendNext:@"hello world"];
        NSLog(@"1111111");
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"2222222");
        }];
    }];
    
    [signal subscribeNext:^(id  _Nullable x) {
           NSLog(@"订阅了： %@",x);
    }];
    
}


@end
