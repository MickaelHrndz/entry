#import "EntryPlugin.h"
#if __has_include(<entry/entry-Swift.h>)
#import <entry/entry-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "entry-Swift.h"
#endif

@implementation EntryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEntryPlugin registerWithRegistrar:registrar];
}
@end
