//
//  ComposeViewController.h
//  Instagram
//
//  Created by tomisin on 7/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate

- (void)didPost;

@end

@interface ComposeViewController : UIViewController

@property (weak, nonatomic) id<ComposeViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
