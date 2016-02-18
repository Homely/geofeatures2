/*
 *   CoordinateCollectionType.swift
 *
 *   Copyright 2016 Tony Stone
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 *
 *   Created by Tony Stone on 2/14/16.
 */
import Swift

public protocol CoordinateCollectionType : CollectionType, MutableCollectionType, _DestructorSafeContainer {
    
    /**
        CoordinateCollectionType must define its Element
     */
    typealias Element
    
    /**
        CoordinateCollectionType must be empty constructable
     */
    init ()
    
    
    /**
        CoordinateCollectionType can be constructed from any SequenceType as long as it has an
        Element type equal Coordinate2D.
     */
    init<C : CollectionType where C.Generator.Element == Coordinate2D, C.Index.Distance == Int>(coordinates: C, precision: Precision)
    
    /**
        CoordinateCollectionType can be constructed from any CollectionType including Array as
        long as it has an Element type equal Coordinate3D and the Distance
        is an Int type.
     */
    init<C : CollectionType where C.Generator.Element == Coordinate3D, C.Index.Distance == Int>(coordinates: C, precision: Precision)
    
    /**
     - Returns: The number of Geometry objects.
     */
    var count: Int { get }
    
    /**
        - Returns: The current minimum capacity.
     */
    var capacity: Int { get }
    
    /**
        Reserve enough space to store `minimumCapacity` elements.
     
        - Postcondition: `capacity >= minimumCapacity` and the array has
          mutable contiguous storage.
     */
    mutating func reserveCapacity(minimumCapacity: Int)
    
    /**
        Append `newElement`.
     */
    mutating func append(newElement: Element)
    
    /**
        Append the elements of `newElements`.
     */
    mutating func appendContentsOf<C : CollectionType where C.Generator.Element == Coordinate2D>(newElements: C)
    
    /**
        Append the elements of `newElements`.
     */
    mutating func appendContentsOf<C : CollectionType where C.Generator.Element == Coordinate3D>(newElements: C)
    
    /**
        Remove an element from the end of the CoordinateCollectionType.
     
        - Requires: `count > 0`.
     */
    mutating func removeLast() -> Element
    
    /**
        Insert `newElement` at index `i`.
     
        - Requires: `i <= count`.
     */
    mutating func insert(newElement: Element, atIndex i: Int)
    
    /**
        Remove and return the element at index `i`.
     */
    mutating func removeAtIndex(index: Int) -> Element
    
    /**
        Remove all elements.
     
        - Postcondition: `capacity == 0` iff `keepCapacity` is `false`.
     */
    mutating func removeAll(keepCapacity keepCapacity: Bool)
}
