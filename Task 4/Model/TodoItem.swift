//
//  Obj.swift
//  Task 4
//
//  Created by Amais Sheikh on 27/10/2020.
//  Copyright © 2020 AmaisSheikh. All rights reserved.
//

import Foundation
import RealmSwift

class TodoItem: Object
{
    @objc dynamic var title = ""
    @objc dynamic var isComplete = false
}
