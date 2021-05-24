#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    if (monthNumber == 0 || monthNumber > 12) {
        return nil;
    }
    
    NSDateComponents *dateComponents = [NSDateComponents new];
    [dateComponents setMonth:monthNumber];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"MMMM";
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *month = [gregorian dateFromComponents:dateComponents];
    
    NSString *stringFromDate = [dateFormatter stringFromDate:month];
    
    
    return stringFromDate;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSISO8601DateFormatter *dateFormatterISO8601 = [NSISO8601DateFormatter new];
    dateFormatterISO8601.formatOptions = NSISO8601DateFormatWithInternetDateTime;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"dd";
    
    NSDate *formattedDate = [dateFormatterISO8601 dateFromString:date];
    
    long day = [[dateFormatter stringFromDate:formattedDate] integerValue];    
    
    return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    dateFormatter.dateFormat = @"E";
    dateFormatter.locale = locale;
    
    NSString *dayName = [dateFormatter stringFromDate:date];
    
    return dayName;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    [gregorian setLocale:locale];
    NSDateComponents *inputDateComponents = [gregorian components:NSCalendarUnitWeekOfYear fromDate:date];
    NSDateComponents *todayDateComponents = [gregorian components:NSCalendarUnitWeekOfYear fromDate:[NSDate date]];
    
    
    if ([inputDateComponents year] != [todayDateComponents year]) {
        return NO;
    }
    
    NSInteger inputWeek = [inputDateComponents weekOfYear];
    NSInteger todayWeek = [todayDateComponents weekOfYear];
    
    if (inputWeek == todayWeek) {
        return YES;
    } else {
        return NO;
    }
    
    return NO;
}

@end
