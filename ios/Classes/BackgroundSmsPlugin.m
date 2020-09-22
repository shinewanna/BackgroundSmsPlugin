#import "BackgroundSmsPlugin.h"
#if __has_include(<background_sms/background_sms-Swift.h>)
#import <background_sms/background_sms-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "background_sms-Swift.h"
#endif

@implementation BackgroundSmsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBackgroundSmsPlugin registerWithRegistrar:registrar];
}
@end
