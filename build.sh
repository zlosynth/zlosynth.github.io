#!/usr/bin/env bash

set -e

modules=(achordion kaseta)

echo 'Rendering the index'
(
    export MODULES=''
    for module in ${modules[@]}; do
        set -a; source "src/${module}/frontpage-module.env"; set +a
        export MODULES="${MODULES}$(envsubst < src/frontpage/module.html.tmpl)"
    done

    export CONTENT="$(envsubst < src/frontpage/frontpage.html.tmpl)"

    set -a; source src/frontpage/header.env; set +a
    export HEADER="$(cat src/header.html.tmpl)"

    export FOOTER="$(cat src/footer-long.html.tmpl)"

    PAGE="$(envsubst < src/main.html.tmpl)"
    echo "${PAGE}" > docs/index.html
)

for module in ${modules[@]}; do
    echo "Rendering ${module} overview"
    (
        export CONTENT="$(cat src/${module}/overview.html.tmpl)"

        set -a; source "src/${module}/overview.header.env"; set +a
        export HEADER="$(cat src/header.html.tmpl)"

        export FOOTER="$(cat src/footer-short.html.tmpl)"

        PAGE="$(envsubst < src/main.html.tmpl)"
        echo "${PAGE}" > "docs/${module}/index.html"
    )
done
