FROM alpine

LABEL "repository"="https://github.com/yehan68/yehan-repo-sync"
LABEL "homepage"="https://github.com/marketplace/actions/yehan-repo-sync-action"
LABEL "maintainer"="Ye Han <zhangtong.mr@aliyun.com>"

RUN apk add --no-cache git openssh-client && \
  echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

ADD *.sh /

ENTRYPOINT ["sh", "/entrypoint.sh"]
