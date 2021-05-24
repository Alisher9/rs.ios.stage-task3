#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *str1 = [NSMutableString stringWithString:string1];
    NSMutableString *str2 = [NSMutableString stringWithString:string2];
    
    NSMutableString *ans = [NSMutableString stringWithString:@""];
    
    while(str1.length != 0 || str2.length != 0) {
        if (str1.length == 0) {
            [ans appendString:str2];
            break;
        }
        if (str2.length == 0) {
            [ans appendString:str1];
            break;
        }
        if ([[str1 substringToIndex:1] UTF8String][0] <= [[str2 substringToIndex:1] UTF8String][0]) {
            [ans appendString: [str1 substringToIndex:1]];
            str1 = [[str1 substringFromIndex:1] mutableCopy];
        } else {
            [ans appendString: [str2 substringToIndex:1]];
            str2 = [[str2 substringFromIndex:1] mutableCopy];
        }
    }
    return ans;
}

@end
