//
//  Constants.swift
//  ChatApp
//
//  Created by Paritosh Pawar on 25/09/18.
//  Copyright © 2018 Mindstix. All rights reserved.
//

import Foundation
import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
