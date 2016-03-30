//
//  ViewController.m
//  Fingerprint
//
//  Created by ymm on 16/3/23.
//  Copyright © 2016年 MM. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)clicked:(id)sender {

    LAContext *context = [[LAContext alloc] init];
    __block  NSString *message;
    //字符串显示身份验证UI与我们的原因.
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Unlock access to locked feature" reply:^(BOOL success, NSError *authenticationError) {
        if (success) {

            message = @"succes";
            [self show:message];
        }
        else {
            message = [NSString stringWithFormat:@"evaluatePolicy: %@", authenticationError.localizedDescription];
            [self show:message];
        }
    }];

}

-(void)show:(NSString *)info{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:info preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:^{
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
