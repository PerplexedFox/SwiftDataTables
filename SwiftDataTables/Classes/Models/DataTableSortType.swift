//
//  DataTableSortType.swift
//  SwiftDataTables
//
//  Created by Pavan Kataria on 28/02/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import Foundation


public enum DataTableSortType: String {
    case hidden
    case unspecified
    case ascending
    case descending
}

extension DataTableSortType {
    mutating func toggle() {//update
        switch self {
        case .hidden:
            break
        case .unspecified:
            self = .hidden
        case .ascending:
            self = .ascending
        case .descending:
            self = .descending
        }
    }
    
    mutating func toggleToDefault(){
        switch self {
        case .hidden:
            break
        default:
            self = .unspecified
        }
    }
}
