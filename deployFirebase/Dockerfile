FROM debian:stable-slim

LABEL "maintainer"="Edric Chan <edric.chan.1997@gmail.com>"

LABEL "com.github.actions.name"="Deploy to Firebase"
LABEL "com.github.actions.description"="Deploys the specified commit/commit on push to Firebase"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/Chan4077/actions/tree/master/deployFirebase"

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
