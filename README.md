# Selina

Selina is an embedded key-value database written in Zig language.

# Usage

```zig
pub fn main() !void {
    var db = try DB.init("./db-name");
    defer db.deinit();
    db.insert("key", "value");
}
```
