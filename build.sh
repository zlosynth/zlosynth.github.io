#!/usr/bin/env bash

set -e

echo 'Rendering the index'
(
    set -a; source src/achordion/frontpage-module.env; set +a
    export MODULES="$(envsubst < src/frontpage/module.html.tmpl)"

    export CONTENT="$(envsubst < src/frontpage/frontpage.html.tmpl)"

    set -a; source src/frontpage/header.env; set +a
    export HEADER="$(cat src/header.html.tmpl)"

    export FOOTER="$(cat src/footer-long.html.tmpl)"

    PAGE="$(envsubst < src/main.html.tmpl)"
    echo "${PAGE}" > docs/index.html
)

echo 'Rendering achordion overview'
(
    export CONTENT="$(cat src/achordion/overview.html.tmpl)"

    set -a; source src/achordion/overview.header.env; set +a
    export HEADER="$(cat src/header.html.tmpl)"

    export FOOTER="$(cat src/footer-short.html.tmpl)"

    PAGE="$(envsubst < src/main.html.tmpl)"
    echo "${PAGE}" > docs/achordion.html
)

echo 'Rendering achordion manual'
(
    export CONTENT="$(cat src/achordion/manual.html.tmpl)"

    set -a; source src/achordion/manual.header.env; set +a
    export HEADER="$(cat src/header.html.tmpl)"

    export FOOTER="$(cat src/footer-short.html.tmpl)"

    PAGE="$(envsubst < src/main.html.tmpl)"
    echo "${PAGE}" > docs/achordion-manual.html
)
