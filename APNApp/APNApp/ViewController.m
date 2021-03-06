#import "ViewController.h"
#import <Helpshift/HelpshiftSupport.h>

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

- (IBAction)help {
    // Show FAQs
    HelpshiftAPIConfigBuilder *apiConfig = [[HelpshiftAPIConfigBuilder alloc] init];
    [HelpshiftSupport showFAQs:self withConfig:apiConfig.build];
}

@end
