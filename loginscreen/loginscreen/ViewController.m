//
//  ViewController.m
//  loginscreen
//
//  Created by Dinesh Jaganathan on 16/10/16.
//  Copyright © 2016 Greens. All rights reserved.
//

#import "ViewController.h"

#import "login.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    NSArray *array1=[[NSArray alloc]initWithObjects:@"arun", nil];
//    NSArray *array2=[[NSArray alloc]initWithObjects:@"arun", nil];
//    NSArray *array3=[[NSArray alloc]initWithObjects:@"arun", nil];
//
//  inputData = [NSDictionary dictionaryWithObjectsAndKeys:usernameField.text,@"Username", _email.text,@"email",_firstname.text,@"firstname",_phoneno.text,@"phoneno",_city.text,@"city" ,_state.text,@"state" , _country.text,@"country",_institute.text,@"institute",_pincode.text,@"pincode", nil];
//    NSLog(@"%@",inputData);
//   
//    jsonInputData = [NSJSONSerialization dataWithJSONObject:inputData options:NSJSONWritingPrettyPrinted error:nil];
//    jsonInputString = [[NSString alloc] initWithData:jsonInputData encoding:NSUTF8StringEncoding];
//    url = [NSURL URLWithString:@"http://educate-on.zordec.com/user/register/"];
//    request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody:[jsonInputString dataUsingEncoding:NSUTF8StringEncoding]];
//     connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
//    
//    jsonOutputData = [[NSMutableData alloc]init];
    
    
   
       // Do any additional setup after loading the view, typically from a nib.
//    
//    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//    
//    if(![defaults boolForKey:@"registered"])
//        
//    {
//        
//        NSLog(@"no user registered");
//        
//        loginBtn.hidden=YES;//hideloginbuttonwhileregistertheuser
//        
//    }
//    
//    else
//        
//    {
//        
//        NSLog(@"USer is registerd");
//        
//        reEnterPasswordField.hidden=YES;
//        
//        registerBtn.hidden=YES;//hideregisterandreenterpasswordbutton
//        
//        
//        
//    }
//    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

-(IBAction)registerUser

{
    
    
    
    inputData = [NSDictionary dictionaryWithObjectsAndKeys:usernameField.text,@"username", _email.text,@"email",_firstname.text,@"firstname",_phoneno.text,@"phoneno",_city.text,@"city" ,_state.text,@"state" , _country.text,@"country",_institute.text,@"institute",_pincode.text,@"pincode", nil];
    NSLog(@"%@",inputData);
    
    jsonInputData = [NSJSONSerialization dataWithJSONObject:inputData options:NSJSONWritingPrettyPrinted error:nil];
    jsonInputString = [[NSString alloc] initWithData:jsonInputData encoding:NSUTF8StringEncoding];
    url = [NSURL URLWithString:@"http://educate-on.zordec.com/user/register/"];
    request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[jsonInputString dataUsingEncoding:NSUTF8StringEncoding]];
    connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    jsonOutputData = [[NSMutableData alloc]init];

    
    
    
    
    if([usernameField.text isEqualToString:@""]||[passwordField.text isEqualToString:@""]||[reEnterPasswordField.text isEqualToString:@""]){
        
        UIAlertView *error=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"You must Complete All Field" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [error show];
        
        //        login *sec=[self.storyboard instantiateViewControllerWithIdentifier:@"login"];
        
        //        [self presentViewController:sec animated:YES completion:nil];
        
        //
        
    }
    
    else
        
    {
        
        [self checkPasswordsMatch];
        
    }
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
{
    
    [jsonOutputData appendData:data ];
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;{
    NSDictionary *dict= [NSJSONSerialization JSONObjectWithData: jsonOutputData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",dict);
    
//    if ([inputData isKindOfClass:[NSDictionary class]]) {
//      //  jsonRe
//    } else {
//        // Error-handling code
//    }
//    inputData = [inputData objectForKey:@"username"];
//    if (inputData == nil) {
//        // Server may have returned a response containing an error
//        // The "ExceptionType" value is returned from my .NET server used in sample
//         inputData = [inputData objectForKey:@"ExceptionType"];
//        if (inputData != nil) {
//            
//        }
//    }
//    NSLog(@"DidFinishLoading");
//    
    
}



-(void)checkPasswordsMatch

{
    
    
    
    if([passwordField.text isEqualToString:reEnterPasswordField.text])
        
    {
        
        NSLog(@"password match");
        
        [self registerNewUser];
        
    }
    
    
    
    else
        
        
        
    {
        
        NSLog(@"Password does not Match");
        
        UIAlertView *error=[[UIAlertView alloc]initWithTitle:@"Password Not Match" message:@"your password and reenter password not match please check" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [error show];
        
        
        
    }
    
}

-(void)registerNewUser

{
    
    
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    [defaults setObject:usernameField.text forKey:@"username"];
    
    [defaults setObject:passwordField.text forKey:@"password"];
    
    [defaults setBool:YES forKey:@"registered"]; //username and password match
    
    [defaults synchronize];
    
    UIAlertView *sucess=[[UIAlertView alloc]initWithTitle:@"user login sucess" message:@"login" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    
    
    
    login *sec=[self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    
    [self presentViewController:sec animated:YES completion:nil];
    
    usernameField.text=@"";
    
    passwordField.text=@"";
    
    reEnterPasswordField.text=@"";
    
    
    
    //
    
    //[self performSegueWithIdentifier:@"login" sender:self];
    
    
    
}



-(IBAction)LoginUser

{
    
    
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    if([usernameField.text isEqualToString:[defaults objectForKey:@"username"]]&&[passwordField.text isEqualToString:[defaults objectForKey:@"password"]])
        
    {
        
        
        
        NSLog(@"login succeed");
        
        //[self performSegueWithIdentifier:@"login" sender:self];
        
        usernameField.text=nil;                passwordField.text=nil;
        
        login *sec=[self.storyboard instantiateViewControllerWithIdentifier:@"login"];
        
        [self presentViewController:sec animated:YES completion:nil];
        
        usernameField.text=@"";
        
        passwordField.text=@"";
        
        
        
    }
    
    else
        
    {
        
        NSLog(@"login unsuccess");
        
        
        
        UIAlertView *error=[[UIAlertView alloc]initWithTitle:@"Password Not Match" message:@"your password and username incorrect" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [error show];
        
        
        
    }
    
    
    
    
    
}







@end