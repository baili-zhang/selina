# Selina

Selina is an embedded key-value database written in Zig language.

---

Selina 是一个使用 Zig 语言开发的嵌入式 key-value 数据库。

# Usage | 使用案例

```zig
pub fn main() !void {
    var db = try DB.init("./db-name");
    defer db.deinit();
    db.insert("key", "value");
}
```
