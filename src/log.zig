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

const INFO_STRING_MSG = "[INFO] {s}. - Params: \"{s}\"\n";
const INFO_ANY_MSG = "[INFO] {s}. - Params: \"{any}\"\n";
const ERROR_MSG = "";

pub const Log = struct {
    pub fn printInfo(msg: []const u8, param: anytype) !void {
        const stdout = std.io.getStdOut().writer();

        switch (@TypeOf(param)) {
            []const u8 => try stdout.print(INFO_STRING_MSG, .{ msg, param }),
            else => try stdout.print(INFO_ANY_MSG, .{ msg, param }),
        }
    }
};
