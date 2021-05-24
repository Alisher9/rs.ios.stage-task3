#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    int ans = 0;
    BOOL ratingIlessThanJ;
    BOOL ratingJLessThanK;
    BOOL sortedAscending;
    BOOL ratingIGreaterThanJ;
    BOOL ratingJGreaterThanK;
    BOOL sortedDescending;
    
    for (int i = 0; i < ratingArray.count; ++i) {
        
        for (int j = i + 1; j < ratingArray.count; ++j) {
            
            for (int k = j + 1; k < ratingArray.count; ++k) {
                
                ratingIGreaterThanJ = [ratingArray[i] intValue] > [ratingArray[j] intValue];
                ratingJGreaterThanK = [ratingArray[j] intValue] > [ratingArray[k] intValue];
                sortedDescending = ratingIGreaterThanJ && ratingJGreaterThanK;
                
                ratingIlessThanJ = [ratingArray[i] intValue] < [ratingArray[j] intValue];
                ratingJLessThanK = [ratingArray[j] intValue] < [ratingArray[k] intValue];
                sortedAscending = ratingIlessThanJ && ratingJLessThanK;
                
                if (sortedDescending || sortedAscending){
                    ans++;
                }
            }
        }
    }
    return ans;
}

@end
