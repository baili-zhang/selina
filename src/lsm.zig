pub const LSM = struct {
    pub fn insert(self: *LSM, key: []const u8, value: []const u8) void {
        _ = self;
        _ = key;
        _ = value;
    }

    pub fn find(self: *LSM, key: []const u8) []u8 {
        _ = self;
        _ = key;
        return &[0]u8{};
    }

    pub fn exist(self: *LSM, key: []const u8) bool {
        _ = self;
        _ = key;
        return false;
    }

    pub fn range_next(self: *LSM, key: []const u8, limit: u32) void {
        _ = self;
        _ = key;
        _ = limit;
    }

    pub fn range_before(self: *LSM, key: []const u8, limit: u32) void {
        _ = self;
        _ = key;
        _ = limit;
    }

    pub fn delete(self: *LSM, key: []const u8) void {
        _ = self;
        _ = key;
    }

    pub fn deinit(self: *LSM) void {
        _ = self;
    }
};
