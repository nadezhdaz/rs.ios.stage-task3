#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger numberOfTeams = 0;
    
    for (NSInteger i = 0; i < ratingArray.count; i++) {
        for (NSInteger j = i + 1; j < ratingArray.count; j++) {
            for (NSInteger k = j + 1; k < ratingArray.count; k++) {
                NSUInteger iPlayerScore = [ratingArray[i] integerValue];
                NSUInteger jPlayerScore = [ratingArray[j] integerValue];
                NSUInteger kPlayerScore = [ratingArray[k] integerValue];
                BOOL areTeamsIncluded = ((iPlayerScore < jPlayerScore && jPlayerScore < kPlayerScore) || (iPlayerScore > jPlayerScore && jPlayerScore > kPlayerScore)) && (0 <= i < j < k < ratingArray.count);
                if (areTeamsIncluded) {
                    numberOfTeams++;
                }
            }
        }
    }
    
    return numberOfTeams;
}

@end
