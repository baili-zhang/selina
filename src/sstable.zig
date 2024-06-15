// Copyright 2024 Baili Zhang.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

const BloomFilter = struct {
    pub fn init() BloomFilter {
        return .{};
    }

    pub fn deinit() void {}
};

pub const SsTableError = error{
    SsTableFileMissing,
};

pub const SsTable = struct {
    bloom_filter: BloomFilter,

    pub fn init(path: []const u8) !SsTable {
        _ = path;
    }
    pub fn deinit() void {}
};