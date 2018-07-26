#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <Cephei/HBPreferences.h>

//Screen recorder headers (via ReplayKit)
@interface RPScreenRecorder : NSObject {
	/*^block*/id _captureHandler;
}
+(id)sharedRecorder;
-(BOOL)isRecording;
-(void)setRecording:(BOOL)arg1;
-(BOOL)systemRecording;
-(void)setSystemRecording:(BOOL)arg1;
-(void)stopSystemRecording:(/*^block*/id)arg1;
-(void)stopRecordingWithHandler:(/*^block*/id)arg1;
-(void)startRecordingWithMicrophoneEnabled:(BOOL)arg1 windowToRecord:(id)arg2 systemRecording:(BOOL)arg3 handler:(/*^block*/id)arg4;
-(void)startRecordingWithMicrophoneEnabled:(BOOL)arg1 handler:(/*^block*/id)arg2;
@end

//StatusBar stuff
@interface UIStatusBar : UIView
@end

@interface UIStatusBar_Modern : UIView
@end

//BOOL for enabling stuff
BOOL kEnabled;
BOOL kUseMicrophone;
//Prefs :P
HBPreferences *preferences;