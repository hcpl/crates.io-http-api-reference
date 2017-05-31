#! /bin/sh

cat <<EOF
# [crates.io](https://crates.io) HTTP API Reference


## Reference

**Note**: All paths presented here are relative to https://crates.io/api/v1!

EOF

jq -r "$(cat api_to_reference.jq)" api.json

cat <<EOF


## Description
EOF

jq -r "$(cat api_to_description.jq)" api.json
