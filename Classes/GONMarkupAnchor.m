//
//  GONMarkupAnchor.m
//  GONMarkupParserSample
//
//  Created by Nicolas Goutaland on 04/02/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//

#import "GONMarkupAnchor.h"

@interface GONMarkupAnchor ()
@end

@implementation GONMarkupAnchor
#pragma mark - Constructor
+ (instancetype)anchorMarkup
{
    return [self markupForTag:GONMarkupAnchor_TAG];
}

#pragma mark - Style
- (void)openingMarkupFound:(NSString *)tag configuration:(NSMutableDictionary *)configurationDictionary context:(NSMutableDictionary *)context attributes:(NSDictionary *)dicAttributes
{
    NSString *value = [dicAttributes objectForKey:GONMarkupAnchor_TAG_href_ATT];
    if (value)
    {
        NSTextAttachment *attachment = [[NSTextAttachment alloc] initWithData:[[value stringByRemovingPercentEncoding] dataUsingEncoding:NSUTF8StringEncoding] ofType:nil];

        [configurationDictionary setObject:attachment
                                    forKey:NSLinkAttributeName];
    }
}

@end