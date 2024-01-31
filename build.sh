#!/usr/bin/env bash

set -e

modules=(achordion kaseta)
retailers=(beatsville schneidersladen lectronz)

echo 'Rendering the index'
(
    export MODULES=''
    for module in ${modules[@]}; do
        set -a; source "src/modules/${module}/frontpage-module.env"; set +a
        export MODULES="${MODULES}$(envsubst < src/frontpage/module.html.tmpl)"
    done

    export CONTENT="$(envsubst < src/frontpage/frontpage.html.tmpl)"

    set -a; source src/frontpage/header.env; set +a
    export HEADER="$(cat src/header.html.tmpl)"

    export FOOTER="$(cat src/footer-long.html.tmpl)"

    PAGE="$(envsubst < src/main.html.tmpl)"
    echo "${PAGE}" > docs/index.html
)

echo 'Rendering retailers'
(
    export RETAILERS=''
    for retailer in ${retailers[@]}; do
        set -a; source "src/retailers/retailer-${retailer}.env"; set +a
        export RETAILERS="${RETAILERS}$(envsubst < src/retailers/retailer.html.tmpl)"
    done

    export CONTENT="$(envsubst < src/retailers/retailers.html.tmpl)"

    set -a; source src/retailers/header.env; set +a
    export HEADER="$(cat src/header.html.tmpl)"

    export FOOTER="$(cat src/footer-short.html.tmpl)"

    PAGE="$(envsubst < src/main.html.tmpl)"
    echo "${PAGE}" > docs/retailers/index.html
)

for module in ${modules[@]}; do
    echo "Rendering ${module} overview"
    (
        export CONTENT="$(cat src/modules/${module}/overview.html.tmpl)"

        set -a; source "src/modules/${module}/overview.header.env"; set +a
        export HEADER="$(cat src/header.html.tmpl)"

        export FOOTER="$(cat src/footer-short.html.tmpl)"

        PAGE="$(envsubst < src/main.html.tmpl)"
        echo "${PAGE}" > "docs/${module}/index.html"
    )
done
