//
//  ViewController.h
//  loginscreen
//
//  Created by Dinesh Jaganathan on 16/10/16.
//  Copyright © 2016 Greens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UIButton *registerBtn;
    
    IBOutlet UIButton *loginBtn;
    
    IBOutlet UITextField *usernameField;
    
    IBOutlet UITextField *passwordField;
    
    IBOutlet UITextField *reEnterPasswordField;
    
    NSDictionary *inputData;
    
    NSMutableData *jsonInputData;
    
    NSMutableData *jsonOutputData;

    NSString *jsonInputString;
    NSURL *url ;
    NSMutableURLRequest *request;
NSURLResponse *response;
    NSURLConnection *connection;
    
    
}
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *firstname;
@property (weak, nonatomic) IBOutlet UITextField *phoneno;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *country;
@property (weak, nonatomic) IBOutlet UITextField *institute;
@property (weak, nonatomic) IBOutlet UITextField *pincode;


-(IBAction)registerUser;

-(IBAction)LoginUser;

@end
