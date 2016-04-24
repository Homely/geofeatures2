/*
 *   GeometryCollection+GeometryTests.swift
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
 *   Created by Tony Stone on 4/24/16.
 */
import XCTest
import GeoFeatures2

// MARK: - FloatingPrecision, Cartesian -

class GeometryCollection_Geometry_FloatingPrecision_Cartesian_Tests : XCTestCase {
    
    let precision = FloatingPrecision()
    let crs       = Cartesian()
    
    func testDimension ()   {
        XCTAssertEqual(GeometryCollection(precision: precision, coordinateReferenceSystem: crs).dimension, -1)
    }
    
    func testDimension_Homogeneous_Point ()   {
        XCTAssertEqual(GeometryCollection(elements: [Point<Coordinate2D>(coordinate: (x: 1, y: 1))] as [Geometry], precision: precision, coordinateReferenceSystem: crs).dimension, 0)
    }
    
    func testDimension_Homogeneous_LineString ()   {
        XCTAssertEqual(GeometryCollection(elements: [LineString<Coordinate2D>()] as [Geometry], precision: precision, coordinateReferenceSystem: crs).dimension, 1)
    }
    
    func testDimension_Homogeneous_Polygon ()   {
        XCTAssertEqual(GeometryCollection(elements: [Polygon<Coordinate2D>()] as [Geometry], precision: precision, coordinateReferenceSystem: crs).dimension, 2)
    }
    
    func testDimension_Non_Homogeneous_Point_Polygon ()   {
        XCTAssertEqual(GeometryCollection(elements: [Point<Coordinate2D>(coordinate: (x: 1, y: 1)), Polygon<Coordinate2D>()] as [Geometry], precision: precision, coordinateReferenceSystem: crs).dimension, 2)
    }
    
    func testDimension_Non_Homogeneous_Point_LineString ()   {
        XCTAssertEqual(GeometryCollection(elements: [Point<Coordinate2D>(coordinate: (x: 1, y: 1)), LineString<Coordinate2D>()] as [Geometry], precision: precision, coordinateReferenceSystem: crs).dimension, 1)
    }
}

// MARK: - FixedPrecision, Cartesian -

class GeometryCollection_Geometry_FixedPrecision_Cartesian_Tests : XCTestCase {
    
    let precision = FixedPrecision(scale: 100)
    let crs       = Cartesian()
    
    func testDimension ()   {
        XCTAssertEqual(GeometryCollection(precision: precision, coordinateReferenceSystem: crs).dimension, -1)
    }
    
    func testDimension_Homogeneous_Point ()   {
        XCTAssertEqual(GeometryCollection(elements: [Point<Coordinate2D>(coordinate: (x: 1, y: 1))] as [Geometry], precision: precision, coordinateReferenceSystem: crs).dimension, 0)
    }
    
    func testDimension_Homogeneous_LineString ()   {
        XCTAssertEqual(GeometryCollection(elements: [LineString<Coordinate2D>()] as [Geometry], precision: precision, coordinateReferenceSystem: crs).dimension, 1)
    }
    
    func testDimension_Homogeneous_Polygon ()   {
        XCTAssertEqual(GeometryCollection(elements: [Polygon<Coordinate2D>()] as [Geometry], precision: precision, coordinateReferenceSystem: crs).dimension, 2)
    }
    
    func testDimension_Non_Homogeneous_Point_Polygon ()   {
        XCTAssertEqual(GeometryCollection(elements: [Point<Coordinate2D>(coordinate: (x: 1, y: 1)), Polygon<Coordinate2D>()] as [Geometry], precision: precision, coordinateReferenceSystem: crs).dimension, 2)
    }
    
    func testDimension_Non_Homogeneous_Point_LineString ()   {
        XCTAssertEqual(GeometryCollection(elements: [Point<Coordinate2D>(coordinate: (x: 1, y: 1)), LineString<Coordinate2D>()] as [Geometry], precision: precision, coordinateReferenceSystem: crs).dimension, 1)
    }
}
