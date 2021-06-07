From: Christian Stewart <christian@paral.in>
Date: Sun,  6 Jun 2021 23:07:30 -0700
Subject: [Buildroot] [PATCH 2/2] package/docker-cli: bump version to 20.10.7
In-Reply-To: <20210607060730.1476825-1-christian@paral.in>
References: <20210607060730.1476825-1-christian@paral.in>
Message-ID: <20210607060730.1476825-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index bb3444c270..6d380c2fd8 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eda53b96ab83a59502df2e5e00ab7ee867243259407ef454be55e695303c1113  docker-cli-20.10.6.tar.gz
+sha256  0a7848b1b5031483de075433506d0448ddf834368d9c73770e453e0b89b49747  docker-cli-20.10.7.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 9c3690e4c3..24fd26a8c6 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.6
+DOCKER_CLI_VERSION = 20.10.7
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.31.1
