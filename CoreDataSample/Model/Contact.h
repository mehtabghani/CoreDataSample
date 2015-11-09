//
//  Contact.h
//  CoreDataSample
//
//  Created by mehtab on 11/9/15.
//  Copyright (c) 2015 mehtab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phone_no;

@end
