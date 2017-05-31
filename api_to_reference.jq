# For jq 1.3 compatibility
def join(str):
    (reduce .[] as $item
        (null; (if . == null then "" else . + str end) + ($item|tostring))) as $res |
    if $res == null then "" else $res end;


def method_lowercase:
    if   .name == "GET"    then "get"
    elif .name == "PUT"    then "put"
    elif .name == "DELETE" then "delete"
    else ""
    end;

def method(pseudo_path):
    if length == 0
    then "(no access)"
    else [.[] | "[`\(.name)`](#user-content-\(method_lowercase)-\(pseudo_path|join("")))"] | join("/")
    end;

def to_path_component:
    (if .is_parameter then ":" else "" end) + .name;

def rec(f):
    def r(x; pseudo_path):
        [pseudo_path[], .name] as $pseudo_path |
        reduce range(0; x) as $i
            ("- `/\(to_path_component)` \(.methods|method($pseudo_path))";
             "  " + .),
        (f | r(x + 1; $pseudo_path));
    r(0; []);


.[] | rec(.children[])
