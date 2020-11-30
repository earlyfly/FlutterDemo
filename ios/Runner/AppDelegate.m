#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "FlutterNativePlugin.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
    [FlutterNativePlugin registerWithRegistrar:[self registrarForPlugin:@"FlutterNativePlugin"]];

    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
