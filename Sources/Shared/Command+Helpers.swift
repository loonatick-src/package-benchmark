//
// Copyright (c) 2022 Ordo One AB.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
//
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
//

// Project wide shared types

@_documentation(visibility: internal)
public enum Command: String, CaseIterable {
    case run
    case list
    case baseline
    case thresholds
    case help
    case `init`
}

/// The benchmark data output format.
public enum OutputFormat: String, CaseIterable {
    /// Text output formatted into a visual table suitable for console output
    case text
    /// The text output format, formatted in markdown, suitable for GitHub workflows
    case markdown
    /// Influx data format
    case influx
    /// JMH format consumable by http://jmh.morethan.io
    case jmh
    /// The encoded representation of the underlying histograms capturing the benchmark data, for programmatic use (Codable).
    case histogramEncoded
    /// The histogram percentiles, average, deviation, sample count etc in standard HDR Histogram text format consumable by http://hdrhistogram.github.io/HdrHistogram/plotFiles.html
    case histogram
    /// The raw histogram samples in TSV format for processing by external tools (e.g. Youplot)
    case histogramSamples
    /// The percentiles values betwen (0-100) in TSV format for processing by external tools (e.g. Youplot)
    case histogramPercentiles
    /// The p90 percentile values per metric as a `[BenchmarkMetric: BenchmarkThresholds]` in JSON format, suitable for static thresholds
    case metricP90AbsoluteThresholds
}

public enum Grouping: String, CaseIterable {
    case metric
    case benchmark
}

@_documentation(visibility: internal)
public enum TimeUnits: String, CaseIterable {
    case nanoseconds
    case microseconds
    case milliseconds
    case seconds
    case kiloseconds
    case megaseconds
}

@_documentation(visibility: internal)
public enum ThresholdsOperation: String, CaseIterable {
    case read
    case update
    case check
}

@_documentation(visibility: internal)
public enum BaselineOperation: String, CaseIterable {
    case read
    case update
    case list
    case delete
    case compare
    case check
}

public enum ExitCode: Int32 {
    case success = 0
    case genericFailure = 1
    case thresholdRegression = 2
    case benchmarkJobFailed = 3
    case thresholdImprovement = 4
    case baselineNotFound = 5
    case noPermissions = 6
}
