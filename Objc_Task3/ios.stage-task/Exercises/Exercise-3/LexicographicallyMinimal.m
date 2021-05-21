#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSUInteger string1Length = string1.length;
    NSUInteger string2Length = string2.length;
    NSString *shortestString = string1Length < string2Length ? string1 : string2;
    NSString *longestString = string1Length > string2Length ? string1 : string2;
    
    unichar bufferShort[shortestString.length + 1];
    unichar bufferLong[longestString.length + 1];
    [string1 getCharacters:bufferShort range:NSMakeRange(0, string1Length)];
    [string2 getCharacters:bufferLong range:NSMakeRange(0, string2Length)];
    
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
    
    if (result.length < (string1Length + string2Length)) {
        [result appendString:[longestString substringFromIndex:j]];
    }    
        
    return [result copy];
}

@end
