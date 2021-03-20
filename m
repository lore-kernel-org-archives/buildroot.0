From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 20:08:31 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/docker-cli: bump
 version to 20.10.5
Message-ID: <20210320185734.6A6DA865AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0696f26c92096dc3ab60b2ec866e23b6a9848e01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://docs.docker.com/engine/release-notes/

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit eef5da1f77d4f1dd284fab4c9f543fb884f7a023)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 95b15b539b..f4787062bb 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  aafba3765d9013cb75810b4f4334525f0e74e82ef073b4df9e8b524f3794e60a  docker-cli-20.10.3.tar.gz
+sha256  4ba845f8c7e2e0a2ca1ec6589847159ca8d0d37b609f0e6f78def7a893b9b342  docker-cli-20.10.5.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index d90c3b7d10..d710bb2fee 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.3
+DOCKER_CLI_VERSION = 20.10.5
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
