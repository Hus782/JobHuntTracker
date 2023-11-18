//
//  JobApplicationEntity+CoreDataProperties.swift
//  JobHuntTracker
//
//  Created by user248930 on 11/18/23.
//
//

import Foundation
import CoreData


extension JobApplicationEntity {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<JobApplicationEntity> {
        return NSFetchRequest<JobApplicationEntity>(entityName: "JobApplicationEntity")
    }

    @NSManaged public var companyName: String
    @NSManaged public var jobTitle: String
    @NSManaged public var applicationDate: Date
    @NSManaged public var status: String

}

extension JobApplicationEntity : Identifiable {

}
