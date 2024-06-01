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

const std = @import("std");
const testing = std.testing;

const LsmTree = @import("lsm_tree.zig").LsmTree;

pub const DB = struct {
    path: []const u8,
    lsm_tree: LsmTree,

    pub fn init(db_path: []const u8) !DB {
        const lsm = try LsmTree.init(db_path);
        return .{ .path = db_path, .lsm_tree = lsm };
    }

    pub fn deinit(self: *DB) void {
        self.lsm_tree.deinit();
    }

    pub fn insert(self: *DB, key: []const u8, value: []const u8) void {
        self.lsm_tree.insert(key, value);
    }

    pub fn find(self: *DB, key: []const u8) []u8 {
        return self.lsm_tree.find(key);
    }

    pub fn exist(self: *DB, key: []const u8) bool {
        return self.lsm_tree.exist(key);
    }

    pub fn range_next(self: *DB, key: []const u8, limit: u32) void {
        return self.range_next(key, limit);
    }

    pub fn range_before(self: *DB, key: []const u8, limit: u32) void {
        return self.range_before(key, limit);
    }

    pub fn delete(self: *DB, key: []const u8) void {
        self.lsm_tree.delete(key);
    }
};
