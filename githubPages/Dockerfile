FROM ruby:2.6

LABEL "maintainer"="Edric Chan <edric.chan.1997@gmail.com>"

LABEL "com.github.actions.name"="Build and deploy GitHub page"
LABEL "com.github.actions.description"="Builds & deploys the Jekyll site to the master branch on user pages or to the gh-pages branch on project pages."
LABEL "com.github.actions.icon"="github"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/Chan4077/actions/tree/master/githubPages"

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
