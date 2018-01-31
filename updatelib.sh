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
    | grep "^Subtree is already at commit 58286ba6b8cb1d49934e2f3ac9f82cf6136a3e0a\\.$" \
    | sed 's/^Subtree is already at commit //' \
    | sed 's/\.$//'


