/*
 *   Coordinate2D.swift
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
 *   Created by Tony Stone on 2/9/16.
 */
import Swift

/**
 2D Coordinate
 
 Low level 2 dimensional Coorodinate type
 */
public typealias Coordinate2D = (x: Double, y: Double)

//: Mark: Equatable

internal func coordinateEquals<T : protocol<Comparable, FloatingPointType>>(tuple1: (T,T), _ tuple2: (T,T)) -> Bool {
    return (tuple1.0 == tuple2.0) && (tuple1.1 == tuple2.1)
}

internal func coordinateEquals<T : protocol<Comparable, IntegerType>>(tuple1: (T,T), _ tuple2: (T,T), dimension: Int) -> Bool {
    return (tuple1.0 == tuple2.0) && (tuple1.1 == tuple2.1)
}

//: Mark: Math

internal func coordinateAdd(tuple1: (Double,Double), _ tuple2: (Double,Double)) -> (Double,Double)  {
    return (tuple1.0 + tuple2.0, tuple1.1 + tuple2.1)
}

internal func coordinateAdd(tuple1: (Int,Int), _ tuple2: (Int,Int)) -> (Int,Int)  {
    return (tuple1.0 + tuple2.0, tuple1.1 + tuple2.1)
}

internal func coordinateSubtract(tuple1: (Double,Double), _ tuple2: (Double,Double)) -> (Double,Double) {
    return (tuple1.0 - tuple2.0, tuple1.1 - tuple2.1)
}

internal func coordinateSubtract(tuple1: (Int,Int), _ tuple2: (Int,Int)) -> (Int,Int) {
    return (tuple1.0 - tuple2.0, tuple1.1 - tuple2.1)
}
