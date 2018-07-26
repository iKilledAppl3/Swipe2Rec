#import "Swipe2Rec_prefsheader.h"

@implementation Swipe2RecListController
+ (NSString *)hb_specifierPlist {
    return @"Swipe2Rec";
    
}

//share button
-(void)loadView {
    [super loadView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];
}

//tint color to use for toggles and buttons 
+ (UIColor *)hb_tintColor {
    return [UIColor colorWithRed:208.0/255.0 green:28.0/255.0 blue:0.0/255.0 alpha:1.0];
}

- (void)shareTapped {
   
    NSString *shareText = @"Record your screen with just a swipe on the StatusBar with #Swipe2Rec by @iKilledAppl3! Download free today on the @iospackixrepo!";
	
    NSArray * itemsToShare = @[shareText];
    
	
	UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:itemsToShare applicationActivities:nil];
    
    // and present it
    [self presentActivityController:controller];
}

- (void)presentActivityController:(UIActivityViewController *)controller {
    
    // for iPad: make the presentation a Popover
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.rightBarButtonItem;
 
}

-(void)respring {
    system ("killall SpringBoard");
}

@end

// vim:ft=objc
