//
//  PersistenceHelper.m
//  CoreDataSample
//
//  Created by mehtab on 11/9/15.
//  Copyright (c) 2015 mehtab. All rights reserved.
//

#import "PersistenceHelper.h"
#import "Contact.h"
#import "CoreDataContact.h"

@implementation PersistenceHelper

+(NSString *) getEntityName:(EntityName) name {

    switch (name) {
        case ContactEntity:
            return @"CoreDataContact";
            
        default:
            return @"";
    }

}

+ (NSArray *) getDataOfEntity:(EntityName) entityName context:(NSManagedObjectContext *) managedObject {

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[PersistenceHelper getEntityName:entityName]];
    
    NSError *error = nil;
    NSArray *results = [managedObject executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
        return nil;
    }
    return results;
}


+ (void) save:(id) object entity:(EntityName) entityName context:(NSManagedObjectContext *) managedObject {

    if(entityName == ContactEntity)
        [PersistenceHelper saveContact:object context:managedObject];

}

+ (void) saveContact:(id) object context:(NSManagedObjectContext *) managedObject {

    Contact *_contact = (Contact*) object;
    CoreDataContact *contact = [NSEntityDescription insertNewObjectForEntityForName:@"CoreDataContact" inManagedObjectContext:managedObject];
    contact.name = _contact.name;
    contact.phoneNO = _contact.phone_no;
    
    NSError *error;
    [managedObject save:&error];

}


@end
