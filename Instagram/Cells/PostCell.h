//
//  PostCell.h
//  Instagram
//
//  Created by tomisin on 7/8/21.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UILabel *likes;
@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
