//
//  Post.m
//  Instagram
//
//  Created by tomisin on 7/8/21.
//

#import "Post.h"

@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage: (UIImage * _Nullable)image withCaption: (NSString * _Nullable)caption withCompletion: (PFBooleanResultBlock _Nullable)completion {
    Post *newPost = [[Post alloc] initWithClassName:@"Post"];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    
    [newPost saveInBackgroundWithBlock: completion];
}

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
    
    NSData *imageData = UIImagePNGRepresentation(image);
    
    if(image == nil || imageData == nil){
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
    
}

@end
