//
//  BasicUIElementsViewController.m
//  Refresher-OBJC
//
//  Created by    on 10/25/16.
//  Copyright © 2016     . All rights reserved.
//

#import "BasicUIElementsViewController.h"

#define ORIGIN_X 10
#define ORIGIN_Y 20

@interface BasicUIElementsViewController ()
@property (nonatomic,strong) UIScrollView* scroller;
@property (nonatomic,strong) NSArray* pickerItems;
@property (nonatomic,strong) UITextField* firstNameTextField;
@property (nonatomic,strong) UITextField* selectedDate;

@end

@implementation BasicUIElementsViewController

#pragma marks View Life Cycle Handling

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pickerItems = @[@"John",@"Derek",@"Matt",@"Rob",@"Steve",@"Denny"];
    [self createScroller];
    
    [self createLabel];
    [self createButton];
    [self createTextField];
    [self createTextView];
    [self createSwitch];
    [self createStepper];
    [self createSlider];
    [self createProgressView];
    [self createSegmentedControl];
    [self createActivityIndicator];
    [self createPicker];
    [self createDatePicker];
    [self createImageView];
//    [self showAlertView];
//    [self showActionSheet];
}
/*
- (void) {
}
 */

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // Compute the content size of the scroller once all the subviews are added to it.
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.scroller.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    self.scroller.contentSize = contentRect.size;
}

#pragma marks Private methods

- (void) createScroller{
    self.scroller = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scroller.showsHorizontalScrollIndicator=YES;
    [self.view addSubview:self.scroller];
}

- (void)createLabel{
    UILabel *aLabel = [[UILabel alloc]initWithFrame:CGRectMake(ORIGIN_X, ORIGIN_Y, 200, 40)];
    [aLabel setBackgroundColor:[UIColor clearColor]];
    [aLabel setText:@"Text of the Label"];
    [[self scroller] addSubview:aLabel];
}
- (void)createButton{
    UIButton *aButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    aButton.frame = CGRectMake(ORIGIN_X, ORIGIN_Y * 3, 150, 40);
    [aButton setTitle:@"Title of the Button" forState:UIControlStateNormal];
    aButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [aButton addTarget:self action:@selector(didTapOnButton:) forControlEvents:UIControlEventTouchUpInside];
    aButton.layer.cornerRadius = 10;
    aButton.layer.borderWidth = 1;
    aButton.clipsToBounds = YES;
    aButton.backgroundColor = [UIColor whiteColor];
    [aButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self scroller] addSubview:aButton];
}

- (void)createTextField{
    UITextField *aTextField = [[UITextField alloc]initWithFrame:CGRectMake(ORIGIN_X, ORIGIN_Y * 5.7, 100, 40)];
    [aTextField setBorderStyle:UITextBorderStyleRoundedRect];
    aTextField.placeholder = @"Type here";
    aTextField.delegate= self;
    [self.scroller addSubview:aTextField];
}

- (void)createTextView{
    UITextView *aTextView = [[UITextView alloc] init];
    aTextView.frame = CGRectMake(ORIGIN_X, ORIGIN_Y * 8.8, 310, 60);
    aTextView.text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";
    aTextView.editable = NO;
    [self.scroller addSubview:aTextView];
}

- (void)createSwitch{
    UISwitch *aSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(ORIGIN_X, ORIGIN_Y * 13, 40, 40)];
    [aSwitch addTarget:self action:@selector(didTapOnSwitch:) forControlEvents:UIControlEventValueChanged];
    [self.scroller addSubview:aSwitch];
}

- (void)createStepper {
    UIStepper* aStepper = [[UIStepper alloc] initWithFrame:CGRectMake(ORIGIN_X, ORIGIN_Y * 15.8, 40, 40)];
    [aStepper addTarget:self action:@selector(stepperValueDidChange:) forControlEvents:UIControlEventValueChanged];
    aStepper.maximumValue =10;
    aStepper.minimumValue = 0;
    aStepper.stepValue=2.0;
    [self.scroller addSubview:aStepper];
}

- (void)createSlider{
    CGRect frame = CGRectMake(ORIGIN_X, ORIGIN_Y * 18, 150, 40);
    UISlider *aSlider = [[UISlider alloc] initWithFrame:frame];
    [aSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [aSlider setBackgroundColor:[UIColor clearColor]];
    aSlider.minimumValue = 0.0;
    aSlider.maximumValue = 50.0;
    aSlider.continuous = YES;
    aSlider.value = 25.0;
    [self.scroller addSubview:aSlider];
}

- (void)createProgressView{
    UIProgressView *aProgressView;
    aProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [[aProgressView layer]setFrame:CGRectMake(ORIGIN_X, ORIGIN_Y * 20, 150, 40)];
    // Set Appearence
    aProgressView.progressTintColor = [UIColor colorWithRed:187.0/255 green:160.0/255 blue:209.0/255 alpha:1.0];
    [[aProgressView layer]setCornerRadius:15.0f];
    [[aProgressView layer]setBorderWidth:2.0f];
    [[aProgressView layer]setMasksToBounds:TRUE];
    aProgressView.clipsToBounds = YES;
    [aProgressView layer].borderColor = [UIColor blackColor].CGColor;
    aProgressView.trackTintColor = [UIColor clearColor];
    [aProgressView setProgress: (float)100/15 animated:YES];
    [self.scroller addSubview:aProgressView];

}

- (void) createSegmentedControl{
    UISegmentedControl *aSegmentControl = [[UISegmentedControl alloc]initWithItems:@[@"One",@"Two",@"Three"]];
    aSegmentControl.frame = CGRectMake(ORIGIN_X, ORIGIN_Y * 23, 150, 40);
    [aSegmentControl addTarget:self action:@selector(segmentControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
    [aSegmentControl setSelectedSegmentIndex:0];
    [self.scroller addSubview:aSegmentControl];
}

- (void) createActivityIndicator{
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.alpha = 1.0;
    activityIndicator.backgroundColor = [UIColor yellowColor];
    activityIndicator.center = CGPointMake(ORIGIN_X + 30, ORIGIN_Y * 26);
    [self.scroller addSubview:activityIndicator];
    [activityIndicator startAnimating];
}

- (void)createPicker{
    // Create a textfield to which pickerview is added as input view
    self.firstNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(ORIGIN_X, ORIGIN_Y * 27.5, 200, 40)];
    self.firstNameTextField.placeholder = @"Select First Name";
    self.firstNameTextField.delegate = self;
    [self.firstNameTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.scroller addSubview:self.firstNameTextField];
    UIPickerView* aPickerView = [[UIPickerView alloc]init];
    aPickerView.dataSource = self;
    aPickerView.delegate = self;
    self.firstNameTextField.inputView = aPickerView;
}

- (void)createDatePicker{
    // Create a textfield to which datepicker is added as input view
    self.selectedDate = [[UITextField alloc]initWithFrame:CGRectMake(ORIGIN_X, ORIGIN_Y * 30, 200, 40)];
    self.selectedDate.placeholder = @"Select Date";
    [self.selectedDate setBorderStyle:UITextBorderStyleRoundedRect];
    self.selectedDate.delegate = self;
    [self.scroller addSubview:self.selectedDate];
    UIDatePicker* datePicker = [[UIDatePicker alloc]init];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.selectedDate.inputView = datePicker;
}

- (void)createImageView{
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"monkey_1"]];
    imageView.frame = CGRectMake(ORIGIN_X, ORIGIN_Y * 33, 180, 172);
    imageView.backgroundColor = [UIColor redColor];
    [self.scroller addSubview:imageView];
}

#pragma mark Action of Button Tap

- (void)didTapOnButton:(id)sender{
    UIButton* tappedButton = (UIButton*)sender;
    NSLog(@"Did Tap on Button with title: %@",tappedButton.titleLabel.text);
}

#pragma mark Action of Switch

- (void)didTapOnSwitch:(id)sender{
    if([sender isOn]){
        NSLog(@"Switch is ON");
    } else{
        NSLog(@"Switch is OFF");
    }
}

#pragma mark Text field delegate handling

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
        [textField resignFirstResponder];
    return YES;
}

#pragma mark Stepper Value Changed

- (void) stepperValueDidChange:(UIStepper *)sender {
    double value = [sender value];
    NSLog(@"The stepper Value is: %d",(int)value);
}

#pragma mark Slider Value changed

- (void)sliderValueDidChange: (id)sender{
    UISlider *slider = (UISlider*)sender;
    float value = slider.value;
    NSLog(@"New Slider Value is: %f",value);
}

#pragma marks Segmented Control Value changed

- (void)segmentControlValueDidChange:(UISegmentedControl *)segment{
    switch (segment.selectedSegmentIndex) {
        case 0:
        {
            NSLog(@"Selection One");
        }
            break;
        case 1:
        {
            NSLog(@"Selection Two");
        }
            break;
        case 2:
        {
            NSLog(@"Selection Three");
        }
            break;
        default:
            break;
    }
}

#pragma marks Picker View Data Source

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.pickerItems.count;
}

#pragma marks Picker View Delegate


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [self.pickerItems objectAtIndex:row];
    return title;
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.firstNameTextField.text = [self.pickerItems objectAtIndex:row];
    [self.firstNameTextField resignFirstResponder];
}

#pragma mark Date Picker Value Changed

-(void)datePickerValueChanged:(UIDatePicker *)sender{
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    self.selectedDate.text = [format stringFromDate:sender.date];
    [self.selectedDate resignFirstResponder];
}
@end