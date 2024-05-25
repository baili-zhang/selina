const std = @import("std");
const testing = std.testing;

const LSM = @import("lsm.zig").LSM;

pub const DB = struct {
    path: []const u8,
    lsm: LSM = .{},

    pub fn insert(self: *DB, key: []const u8, value: []const u8) void {
        self.lsm.insert(key, value);
    }

    pub fn find(self: *DB, key: []const u8) []u8 {
        return self.lsm.find(key);
    }

    pub fn exist(self: *DB, key: []const u8) bool {
        return self.lsm.exist(key);
    }

    pub fn range_next(self: *DB, key: []const u8, limit: u32) void {
        return self.range_next(key, limit);
    }

    pub fn range_before(self: *DB, key: []const u8, limit: u32) void {
        return self.range_before(key, limit);
    }

    pub fn delete(self: *DB, key: []const u8) void {
        self.lsm.delete(key);
    }

    pub fn deinit(self: *DB) void {
        self.deinit();
    }
};
