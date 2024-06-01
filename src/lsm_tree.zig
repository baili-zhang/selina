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
const fs = std.fs;

const Log = @import("log.zig").Log;
const Level = @import("level.zig").Level;

const CREATE_NEW_DIR_MSG = "Try to create a new dir";
const DETECTED_DIR_MSG = "The directory has been detected";

pub const LsmTree = struct {
    dir: fs.Dir,
    levels: std.ArrayList(Level),

    pub fn init(db_path: []const u8) !LsmTree {
        const open_config = .{ .iterate = true };

        const cwd = fs.cwd();
        const result = cwd.openDir(db_path, open_config);
        const db_dir = result catch |err| switch (err) {
            error.FileNotFound => new_dir: {
                try Log.printInfo(CREATE_NEW_DIR_MSG, db_path);
                try cwd.makeDir(db_path);
                break :new_dir try cwd.openDir(db_path, open_config);
            },
            else => return err,
        };

        var gpa = std.heap.GeneralPurposeAllocator(.{}){};
        const allocator = gpa.allocator();
        const levels = std.ArrayList(Level).init(allocator);

        var iterator = db_dir.iterate();
        while (try iterator.next()) |entry| {
            if (entry.kind == .directory) {
                try Log.printInfo(DETECTED_DIR_MSG, entry.name);

                const level = Level.init();
                levels.append(level);
            }
        }

        return .{ .dir = db_dir, .levels = levels };
    }

    pub fn deinit(self: *LsmTree) void {
        self.dir.close();
        self.levels.deinit();
    }

    pub fn insert(self: *LsmTree, key: []const u8, value: []const u8) void {
        _ = self;
        _ = key;
        _ = value;
    }

    pub fn find(self: *LsmTree, key: []const u8) []u8 {
        _ = self;
        _ = key;
        return &[0]u8{};
    }

    pub fn exist(self: *LsmTree, key: []const u8) bool {
        _ = self;
        _ = key;
        return false;
    }

    pub fn range_next(self: *LsmTree, key: []const u8, limit: u32) void {
        _ = self;
        _ = key;
        _ = limit;
    }

    pub fn range_before(self: *LsmTree, key: []const u8, limit: u32) void {
        _ = self;
        _ = key;
        _ = limit;
    }

    pub fn delete(self: *LsmTree, key: []const u8) void {
        _ = self;
        _ = key;
    }
};
