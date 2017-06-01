# For jq 1.3 compatibility
def join(str):
    (reduce .[] as $item
        (null; (if . == null then "" else . + str end) + ($item|tostring))) as $res |
    if $res == null then "" else $res end;


def to_path_component:
    (if .is_parameter then ":" else "" end) + .name;

def methods(path):
    .[] | "\n#### `\(.name) /\(path|join("/"))`\n\n\(.description)\(
        if .parameters|length > 0
        then "\n\n##### Parameters\n\n\(.parameters as $p|$p|keys|map("- `\(.)` \($p[.].description)\n  - valid values: \($p[.].valid_values|if type == "array" then map("`\(.)`")|join(", ") elif type == "boolean" and . == true then "any" else tostring end)\n  - \(if $p[.].fallback == null then "no fall back" else "falls back to `\($p[.].fallback)`" end)")|join("\n"))"
        else ""
        end
    )";

def rec(f):
    def r(path):
        [path[], to_path_component] as $path |
        (.methods|methods($path)),
        (f | r($path));
    r([]);


.[] | rec(.children[])
