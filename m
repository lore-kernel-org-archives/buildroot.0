From: Christian Stewart <christian@paral.in>
Date: Fri, 12 Mar 2021 14:48:32 -0800
Subject: [Buildroot] [PATCH 2/3] package/docker-cli: bump version to 20.10.5
In-Reply-To: <20210312224833.1908386-1-christian@paral.in>
References: <20210312224833.1908386-1-christian@paral.in>
Message-ID: <20210312224833.1908386-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://docs.docker.com/engine/release-notes/

Signed-off-by: Christian Stewart <christian@paral.in>
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
-- 
2.30.2
