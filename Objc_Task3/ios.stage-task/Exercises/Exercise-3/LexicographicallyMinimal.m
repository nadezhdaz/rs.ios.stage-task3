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
    
    NSMutableString *processingResult = [NSMutableString string];
    NSInteger i = 0, j = 0;
    
    while (i < shortestString.length) {
        if (bufferShort[i] <= bufferLong[j]) {
            [processingResult appendFormat:@"%c", bufferShort[i]];
            i++;
        } else {
            [processingResult appendFormat:@"%c", bufferLong[j]];
            j++;
        }
        
        
    }
    
    if (processingResult.length < (string1Length + string2Length)) {
        [processingResult appendString:[longestString substringFromIndex:j]];
    }
    
    NSString *result = [NSString stringWithString:processingResult];
        
    return result;
}

@end
