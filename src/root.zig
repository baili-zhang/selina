const std = @import("std");
const testing = std.testing;

const LsmTree = @import("lsm.zig").LsmTree;

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
