const std = @import("std");

const DB = @import("root.zig").DB;

pub fn main() !void {
    var db: DB = .{ .path = "./db-test/temp.db" };
    defer db.deinit();
    _ = db.find("key");
}
