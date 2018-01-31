#!/usr/bin/env bash

git subtree pull --prefix inst/symengine/ \
    git@github.com:symengine/symengine.git master --squash

echo

echo Next: update SymEngineCommit in DESCRIPTION from:
grep SymEngineCommit DESCRIPTION | sed 's/^SymEngineCommit: //'

echo
echo to:
git subtree pull --prefix inst/symengine/ \
    git@github.com:symengine/symengine.git master --squash \
    2>&1 >/dev/null \
    | grep "^Subtree is already at commit ........................................\\.$" \
    | sed 's/^Subtree is already at commit //' \
    | sed 's/\.$//'


