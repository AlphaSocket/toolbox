FROM debian:latest

RUN apt update \
&& apt install bash htop curl docker git mysql-client fcgi nodejs nodejs-npm php7 python python3 py-pip \
# git-get-latest-release
&& curl -fsSL https://raw.githubusercontent.com/AlphaSocket/git-get-latest-release/master/get-latest-release -o /usr/local/bin/git-get-latest-release \
&& chmod +x /usr/local/bin/git-get-latest-release \
# PHP
&& curl -fsSL https://phar.phpunit.de/phpunit.phar -o /usr/local/bin/phpunit.phar \
&& curl -fsSL http://static.phpmd.org/php/latest/phpmd.phar -o /usr/local/bin/phpmd.phar \
&& curl -fsSL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -o /usr/local/bin/phpcs.phar \ \
&& curl -fsSL http://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -o /usr/local/bin/php-cs-fixer.phar \
&& curl -fsSL https://getcomposer.org/composer.phar -o /usr/local/bin/composer.phar \
# Wordpress
&& curl -fsSL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp-cli.phar \
# Magento
&& curl -fsSL https://files.magerun.net/n98-magerun-latest.phar -o /usr/local/bin/n98-magerun.phar \
&& curl -sSL https://raw.githubusercontent.com/colinmollenhour/modman/master/modman -o /usr/local/bin/modman \
&& MAGECONFIGSYNC_LATEST=$(git-get-latest-release https://github.com/punkstar/mageconfigsync ) \
&& curl -sSL https://github.com/punkstar/mageconfigsync/releases/download/$MAGECONFIGSYNC_LATEST/mageconfigsync-${MAGECONFIGSYNC_LATEST}.phar -o /usr/local/bin/mageconfigsync.phar \
# Kubernetes
&& KUBECTL_LATEST=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) \
&& curl -sSL https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_LATEST/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
&& curl -sSL https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 -o /usr/local/bin/minikube \
&& KOPS_LATEST=$(git-get-latest-release https://github.com/kubernetes/kops ) \
&& curl -sSL https://github.com/kubernetes/kops/releases/download/$KOPS_LATEST/kops-linux-amd64 -o /usr/local/bin/kops \
&& ARGO_LATEST=$(git-get-latest-release https://github.com/argoproj/argo ) \
&& curl -sSL https://github.com/argoproj/argo/releases/download/$ARGO_LATEST/argo-linux-amd64 -o /usr/local/bin/argo \
# OnePassword
&& mkdir /tmp/op \
&& curl -sSL https://cache.agilebits.com/dist/1P/op/pkg/v0.4/op_linux_amd64_v0.4.zip -o /tmp/op/op_linux_amd64_v0.4.zip \
&& unzip /tmp/op/op_linux_amd64_v0.4.zip -d /tmp/op \
&& mv /tmp/op/op /usr/local/bin/op \
&& rm -r /tmp/op
