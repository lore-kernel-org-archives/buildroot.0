From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 May 2021 21:32:33 +0200
Subject: [Buildroot] [git commit] package/docker-cli: bump version to 20.10.6
Message-ID: <20210502191018.2CB4B7FACB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02fcc814be2228a5457cba6393f8571630747d6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mario Fink <mario.fink@record-evolution.de>
Tested-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index f4787062bb..bb3444c270 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4ba845f8c7e2e0a2ca1ec6589847159ca8d0d37b609f0e6f78def7a893b9b342  docker-cli-20.10.5.tar.gz
+sha256  eda53b96ab83a59502df2e5e00ab7ee867243259407ef454be55e695303c1113  docker-cli-20.10.6.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 39b4d09c76..9c3690e4c3 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.5
+DOCKER_CLI_VERSION = 20.10.6
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
