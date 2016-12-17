///
///  GeoJSONWriter
///
///  Copyright (c) 2016 Tony Stone
///
///  Licensed under the Apache License, Version 2.0 (the "License");
///  you may not use this file except in compliance with the License.
///  You may obtain a copy of the License at
///
///  http://www.apache.org/licenses/LICENSE-2.0
///
///  Unless required by applicable law or agreed to in writing, software
///  distributed under the License is distributed on an "AS IS" BASIS,
///  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
///  See the License for the specific language governing permissions and
///  limitations under the License.
///
///  Created by Tony Stone on 12/17/16.
///
import Swift
import Foundation

fileprivate let TYPE        = "type"
fileprivate let COORDINATES = "coordinates"

public enum GeoJSONWriterError: Error {
    case unsupportedType(String)
}

///
/// GeoJSONWriter writer for GeoFeatures based on the Internet Engineering Task Force (IETF) proposed standard "The GeoJSON Format"
///
/// - Parameters:
///     - CoordinateType: The coordinate type to use for all generated Geometry types.
///
/// For more information see [Internet Engineering Task Force (IETF) - The GeoJSON Format](https://tools.ietf.org/html/rfc7946#section-4)
///
public class GeoJSONWriter<CoordinateType : Coordinate & CopyConstructable & _ArrayConstructable> {

    ///
    /// Initialize this writer
    ///
    public init() {}

    ///
    /// Based on the geometry passed in, converts it into a Object representation as specified by
    /// the GeoJSON draft spec.
    ///
    /// - Parameter geometry: A `Geometry` type to be converted to GeoJSON
    ///
    /// - Returns: GeoJSON Object for supported type.
    ///
    /// - Throws: `GeoJSONWriterError.unsupportedType` if the `geometry` parameter type is unsupported.
    ///
    public func write(_ geometry: Geometry) throws -> [String: Any] {

        switch geometry {

        case let point as Point<CoordinateType>:
            return self.pointObject(point)

        /// case let lineString as LineString<CoordinateType>:
        ///    return self.lineStringObject(lineString)

        default:
            throw GeoJSONWriterError.unsupportedType("Unsupported type \"\(String(describing: geometry.self))\".")
        }
    }

    fileprivate func pointObject(_ point: Point<CoordinateType>) -> [String : Any] {
        return [TYPE: "Point", COORDINATES: self.coordinateArray(point.coordinate)]
    }

    fileprivate func coordinateArray(_ coordinate: CoordinateType) -> [Double] {

        var coordinateArray = [coordinate.x, coordinate.y]

        if let coordinate = coordinate as? ThreeDimensional {
            coordinateArray.append(coordinate.z)
        }

        if let coordinate = coordinate as? Measured {
            coordinateArray.append(coordinate.m)
        }
        return coordinateArray
    }
}
