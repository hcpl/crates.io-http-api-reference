# For jq 1.3 compatibility
def join(str):
    (reduce .[] as $item
        (null; (if . == null then "" else . + str end) + ($item|tostring))) as $res |
    if $res == null then "" else $res end;


def to_path_component:
    (if .is_parameter then ":" else "" end) + .name;

def methods(path):
    .[] | "\n#### `\(.name) /\(path|join("/"))`\n\n\(.description)";

def rec(f):
    def r(path):
        [path[], to_path_component] as $path |
        (.methods|methods($path)),
        (f | r($path));
    r([]);


.[] | rec(.children[])
