const std = @import("std");

const INFO_MSG = "[INFO] {s}. - Params: \"{s}\"";
const ERROR_MSG = "";

pub const LOG = struct {
    pub fn printInfo(msg: []const u8, param: []const u8) !void {
        const stdout = std.io.getStdOut().writer();
        try stdout.print(INFO_MSG, .{ msg, param });
    }
};
