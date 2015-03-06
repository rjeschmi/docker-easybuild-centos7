#!/bin/bash

source /etc/profile.d/modules.sh
source /etc/profile.d/z99_StdEnv.sh

GITHUB_USER=${GITHUB_USER:-}
GITHUB_TOKEN=${GITHUB_TOKEN:-}
GITHUB_OPT=${GITHUB_USER:+"--upload-test-report --github-user=${GITHUB_USER} --test-report-env-filter='^SSH|USER|HOSTNAME|UID|.*COOKIE.*'|GITHUB_TOKEN"}

FROM_PR=${FROM_PR:-}
FROM_PR_OPT=${FROM_PR:+"--from-pr=${FROM_PR}"}


python -c "import getpass, keyring; keyring.set_password('github_token', '${GITHUB_USER}', '${GITHUB_TOKEN}')"

eb ${FROM_PR_OPT} ${GITHUB_OPT} -dfr

