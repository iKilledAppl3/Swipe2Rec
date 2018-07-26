ARCHS = armv7 arm64
TARGET = iphone:clang:latest
SDK = iPhoneOS8.1
THEOS_BUILD_DIR = DEBs

include theos/makefiles/common.mk

TWEAK_NAME = Swipe2Rec
Swipe2Rec_FILES = Tweak.xm
Swipe2Rec_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error
Swipe2Rec_FRAMEWORKS = UIKit CoreGraphics
Swipe2Rec_LIBRARIES += cephei
Swipe2Rec_LDFLAGS += -Wl,-segalign,4000


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += Swipe2Rec_prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
