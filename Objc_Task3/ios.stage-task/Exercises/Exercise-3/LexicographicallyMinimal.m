#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSString *shortestString = string1.length <= string2.length ? string1 : string2;
    NSString *longestString = string1.length > string2.length ? string1 : string2;
    
    unichar bufferShort[shortestString.length + 1];
    unichar bufferLong[longestString.length + 1];
    
    [shortestString getCharacters:bufferShort range:NSMakeRange(0, shortestString.length)];
    [longestString getCharacters:bufferLong range:NSMakeRange(0, longestString.length)];
    
    NSMutableString *result = [NSMutableString string];
    NSInteger i = 0, j = 0;
    
    while (i < shortestString.length) {
        if (bufferShort[i] <= bufferLong[j]) {
            [result appendFormat:@"%c", bufferShort[i]];
            i++;
        } else {
            [result appendFormat:@"%c", bufferLong[j]];
            j++;
        } 
    }
    
    if (result.length < (string1.length + string2.length)) {
        [result appendString:[longestString substringFromIndex:j]];
    }    
        
    return [result copy];
}

@end
