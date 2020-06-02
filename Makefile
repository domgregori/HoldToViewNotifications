include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HoldToViewNotifications
SDKVERSION = 10.1
HoldToViewNotifications_FILES = Tweak.xm
HoldToViewNotifications_FRAMWORKS = UIKit
DEBUG=0
PACKAGE_VERSION=1.0.2
include $(THEOS_MAKE_PATH)/tweak.mk

internal-stage::
	#Filter plist
	$(ECHO_NOTHING)if [ -f Filter.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/; cp Filter.plist $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/HoldToViewNotifications.plist; fi$(ECHO_END)
	#PreferenceLoader plist
	$(ECHO_NOTHING)if [ -f Preferences.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/HoldToViewNotifications; cp Preferences.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/HoldToViewNotifications/; fi$(ECHO_END)

after-install::
	install.exec "killall backboardd"
