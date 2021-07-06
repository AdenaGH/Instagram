//
//  AppDelegate.m
//  Instagram
//
//  Created by Adena Rowana Ninvalle on 7/6/21.
//

#import "AppDelegate.h"
#import "Parse/Parse.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ParseClientConfiguration *config = [ParseClientConfiguration  configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {

            configuration.applicationId = @"lmH7fH8oxkrcc1mvEWeh2PEhnIcVQsr5CagiyIrd";
            configuration.clientKey = @"RsxQUDQXKa1Qp4OMVFQGbPGqFWYF1nC5EOq4w4MI";
            configuration.server = @"https://parseapi.back4app.com";
        }];

        [Parse initializeWithConfiguration:config];
    //Test
    PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];
     gameScore[@"score"] = @1337;
     gameScore[@"playerName"] = @"Sean Plott";
     gameScore[@"cheatMode"] = @NO;
     [gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
      if (succeeded) {
             NSLog(@"Object saved!");
      } else {
             NSLog(@"Error: %@", error.description);
      }
     }];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
