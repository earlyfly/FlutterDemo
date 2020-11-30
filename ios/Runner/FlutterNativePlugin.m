//
//  FlutterNativePlugin.m
//  Runner
//
//  Created by trs on 2020/11/9.
//

#import "FlutterNativePlugin.h"

@implementation FlutterNativePlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"lianchu" binaryMessenger:[registrar messenger]];
    FlutterNativePlugin *instance = [[FlutterNativePlugin alloc]init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([call.method isEqualToString:@"comeonman"]) {
        result(@"么么哒");
    }else {
        result(FlutterMethodNotImplemented);
    }
}

@end
