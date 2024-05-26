const std = @import("std");

const DB = @import("root.zig").DB;

pub fn main() !void {
    var db = try DB.init("./db-name");
    defer db.deinit();
    _ = db.find("key");
}
