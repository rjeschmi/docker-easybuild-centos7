#!/bin/bash

source /etc/profile.d/modules.sh
source /etc/profile.d/z99_StdEnv.sh

GITHUB_USER=${GITHUB_USER:-}
GITHUB_TOKEN=${GITHUB_TOKEN:-}
GITHUB_OPT=${GITHUB_USER:+"--upload-test-report --github-user=${GITHUB_USER} --test-report-env-filter='^SSH|USER|HOSTNAME|UID|.*COOKIE.*'|GITHUB_TOKEN"}
EB_FILES=${EB_FILES:-}
OTHER_OPTS=${OTHER_OPTS:-}
FROM_PR=${FROM_PR:-}
FROM_PR_OPT=${FROM_PR:+"--from-pr=${FROM_PR}"}


python -c "import getpass, keyring; keyring.set_password('github_token', '${GITHUB_USER}', '${GITHUB_TOKEN}')"

echo "running eb ${EB_FILES} ${FROM_PR_OPT} ${GITHUB_OPT} ${OTHER_OPTS} -dfr"
eb ${EB_FILES} ${FROM_PR_OPT} ${GITHUB_OPT} ${OTHER_OPTS} -dfr

