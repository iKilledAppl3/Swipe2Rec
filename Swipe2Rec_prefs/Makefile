THEOS_BUILD_DIR = DEBs
ARCHS = armv7 arm64
SDK = iPhoneOS8.1
TARGET = iphone:clang:latest

include theos/makefiles/common.mk

BUNDLE_NAME = Swipe2Rec
Swipe2Rec_FILES = Swipe2Rec.mm
Swipe2Rec_INSTALL_PATH = /Library/PreferenceBundles
Swipe2Rec_FRAMEWORKS = UIKit MessageUI CoreGraphics AVFoundation AudioToolbox
Swipe2Rec_PRIVATE_FRAMEWORKS = Preferences
Swipe2Rec_LIBRARIES += cepheiprefs MobileGestalt
Swipe2Rec_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Swipe2Rec.plist$(ECHO_END)
