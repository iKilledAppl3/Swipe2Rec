#import "RPScreenRecorder+Additions.h"

/*Created by iKilledAppl3 on 7/22/18 at 7:38 pm 

This is for my buddy domlast425
Concept was by him :)

*/

%hook UIStatusBar

-(void)layoutSubviews {
	if (kEnabled) {
		%orig;
	self.userInteractionEnabled = YES;
/* thanks to ipadkid358 for this part! (self.gestureRecognizers) :P
*/
      if (self.gestureRecognizers) {
	  return; 
    }
	 UISwipeGestureRecognizer *swipeGestureLeft = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)] autorelease];
	 [swipeGestureLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
	 swipeGestureLeft.numberOfTouchesRequired = 1;
	 [self addGestureRecognizer:swipeGestureLeft];
	 
	 UISwipeGestureRecognizer *swipeGestureRight = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)] autorelease];
	 [swipeGestureRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
	 swipeGestureRight.numberOfTouchesRequired = 1;
	 [self addGestureRecognizer:swipeGestureRight];
	 
 }
	else {
		%orig;
	}
	
}

%new -(void)rightSwipe:(UISwipeGestureRecognizer *)sender {
	RPScreenRecorder *screenRecorder = [%c(RPScreenRecorder) sharedRecorder];
	[screenRecorder stopSystemRecording:(/*^block*/id)nil];
}

%new -(void)leftSwipe:(UISwipeGestureRecognizer *)sender {
	RPScreenRecorder *screenRecorder = [%c(RPScreenRecorder) sharedRecorder];
	[screenRecorder startRecordingWithMicrophoneEnabled:kUseMicrophone windowToRecord:self systemRecording:YES handler:nil];
	
 }
%end


%hook UIStatusBar_Modern

-(void)layoutSubviews {
	if (kEnabled) {
	 %orig;
	self.userInteractionEnabled = YES;
	/* thanks to ipadkid358 for this part! (self.gestureRecognizers) :P
*/
      if (self.gestureRecognizers) {
        return;
    }
	 UISwipeGestureRecognizer *swipeGestureLeft = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)] autorelease];
	 [swipeGestureLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
	 swipeGestureLeft.numberOfTouchesRequired = 1;
	 [self addGestureRecognizer:swipeGestureLeft];
	 
	 UISwipeGestureRecognizer *swipeGestureRight = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)] autorelease];
	 [swipeGestureRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
	 swipeGestureRight.numberOfTouchesRequired = 1;
	 [self addGestureRecognizer:swipeGestureRight];

 }
	else {
		%orig;
	}
	
}

%new -(void)rightSwipe:(UISwipeGestureRecognizer *)sender {
	RPScreenRecorder *screenRecorder = [%c(RPScreenRecorder) sharedRecorder];
	[screenRecorder stopSystemRecording:(/*^block*/id)nil];
}

%new -(void)leftSwipe:(UISwipeGestureRecognizer *)sender {
	RPScreenRecorder *screenRecorder = [%c(RPScreenRecorder) sharedRecorder];
	[screenRecorder startRecordingWithMicrophoneEnabled:kUseMicrophone windowToRecord:self systemRecording:YES handler:nil];
	

}
%end
	
extern NSString *const HBPreferencesDidChangeNotification;
	

%ctor 
{
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.ikilledappl3.swipe2rec"];

	   [preferences registerBool:&kEnabled default:NO forKey:@"kEnabled"];
	   [preferences registerBool:&kUseMicrophone default:NO forKey:@"kUseMicrophone"];
	   
   }	