#import "DateHelper.h"
#import "NSDate+CustomDate.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    if (monthNumber > 12 || monthNumber < 1) {
        return nil;
    }
    NSDate *date = [NSDate dateFrom:1 month:monthNumber year:2021];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"MMMM";
    
    return [formatter stringFromDate:date];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSISO8601DateFormatter *formatter = [NSISO8601DateFormatter new];
    NSDate *dateFromString = [formatter dateFromString:date];
    NSDateComponents *components = [[NSCalendar autoupdatingCurrentCalendar] components: NSCalendarUnitDay fromDate:dateFromString];
    
    return components.day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    formatter.dateFormat = @"E";
    
    return [[formatter stringFromDate:date] capitalizedString];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSInteger currentWeak = [[NSCalendar autoupdatingCurrentCalendar] component:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    NSInteger inputWeak = [[NSCalendar autoupdatingCurrentCalendar] component:NSCalendarUnitWeekOfYear fromDate:date];
    
    return currentWeak == inputWeak;
}

@end
