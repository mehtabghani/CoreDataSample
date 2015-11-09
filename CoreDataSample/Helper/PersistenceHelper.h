//
//  PersistenceHelper.h
//  CoreDataSample
//
//  Created by mehtab on 11/9/15.
//  Copyright (c) 2015 mehtab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataManager.h"

typedef enum {
    ContactEntity
} EntityName ;

@interface PersistenceHelper : NSObject

+ (NSArray *) getDataOfEntity:(EntityName) entityName context:(NSManagedObjectContext *) managedObject;
+ (void) save:(id) object entity:(EntityName) entityName context:(NSManagedObjectContext *) managedObject;

@end
