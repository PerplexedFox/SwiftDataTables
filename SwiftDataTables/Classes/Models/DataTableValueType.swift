//
//  DataTableDataType.swift
//  Pods
//
//  Created by Pavan Kataria on 12/03/2017.
//
//

import Foundation

//MARK: - TODO: 11 march - TODO: See if you can make the multidimensional array a generic object so that it can accept any value type.
//This will probably make sorting easier and could potenntially allow us to get rid of this class

public enum DataTableValueType {
    
    //MARK: - Properties
    case string(String)
    case int(Any)
    case float(Any)
    case double(Any)
    
    
    public var stringRepresentation: String {
        get {
            switch self {
            case .string(let value):
                return String(value)    //updated
            case .int(let value):
                return String(value as! String)  //updated
            case .float(let value):
                return String(value as! String)    //updated
            case .double(let value):
                return String(value as! String)   //updated
            }
        }
    }
    
    public init(_ value: Any){
        //Determine the actual type first
        switch value {
        case let value as Int:
            let str = String(value) //new
            self = .int(str)    //updated
        case let value as Float:
            let str = String(value)    //new
            self = .float(str)  //updated
        case let value as Double:
            let str = String(value) //new
            self = .double(str) //updated
        default:
            let temporaryStringRepresentation = String(describing: value)
            if Int(temporaryStringRepresentation) != nil {  //updated
                self = .int(temporaryStringRepresentation)  //updated
            }
            else if Float(temporaryStringRepresentation) != nil {   //updated
                self = .float(temporaryStringRepresentation)    //updated
            }
            else if Double(temporaryStringRepresentation) != nil {  //updated
                self = .double(temporaryStringRepresentation)   //updated
            }
            else {
                self = .string(temporaryStringRepresentation)
            }
        }
    }
}

extension DataTableValueType: Comparable {
    public static func == (lhs: DataTableValueType, rhs: DataTableValueType) -> Bool {
        return lhs.stringRepresentation == rhs.stringRepresentation
    }
    public static func < (lhs: DataTableValueType, rhs: DataTableValueType) -> Bool {
        switch (lhs, rhs) {
        case (.string(let lhsValue), .string(let rhsValue)):
            return lhsValue < rhsValue
        case (.int(let lhsValue), .int(let rhsValue)):
            let lhsV = Int(lhsValue as! String)!       //new
            let rhsV = Int(rhsValue as! String)!       //new
            return lhsV < rhsV              //updated
        case (.float(let lhsValue), .float(let rhsValue)):
            let lhsV = Float(lhsValue as! String)!       //new
            let rhsV = Float(rhsValue as! String)!       //new
            return lhsV < rhsV                //updated
        case (.double(let lhsValue), .double(let rhsValue)):
            let lhsV = Double(lhsValue as! String)!       //new
            let rhsV = Double(rhsValue as! String)!       //new
            return lhsV < rhsV                 //updated
        default:
            return lhs.stringRepresentation < rhs.stringRepresentation
        }
    }
}
