const std = @import("std");
const testing = std.testing;
const fs = std.fs;

const LSM = @import("lsm.zig").LSM;
const LOG = @import("log.zig").LOG;

const CREATE_NEW_DIR_MSG = "Try to create a new dir";

pub const DB = struct {
    path: []const u8,
    lsm: LSM,
    dir: fs.Dir,

    pub fn init(db_path: []const u8) !DB {
        const cwd = fs.cwd();
        const result = cwd.openDir(db_path, .{});
        const db_dir = result catch |err| switch (err) {
            error.FileNotFound => new_dir: {
                try LOG.printInfo(CREATE_NEW_DIR_MSG, db_path);
                try cwd.makeDir(db_path);
                break :new_dir try cwd.openDir(db_path, .{});
            },
            else => return err,
        };

        return .{ .path = db_path, .lsm = .{}, .dir = db_dir };
    }

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
        self.lsm.deinit();
        self.dir.close();
    }
};
