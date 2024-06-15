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
const fmt = std.fmt;

const Log = @import("log.zig").Log;

const LOAD_LEVEL_MSG = "Load level from directory.";

const DEFAULT_LEVEL_DIR_NAME_LENTH = 8;

fn levelPath(db_path: []const u8, level_id: u32) []const u8 {
    _ = db_path;
    _ = level_id;
    // TODO
    return "";
}

pub const Level = struct {
    path: []const u8,
    level_id: u32,

    pub fn init(db_path: []const u8, level_id: u32) !Level {
        const path = levelPath(db_path, level_id);

        try Log.printInfo(LOAD_LEVEL_MSG, path);

        return .{ .path = path, .level_id = level_id };
    }

    pub fn toId(name: []const u8) !u32 {
        return try fmt.parseUnsigned(u32, name, 10);
    }
};
