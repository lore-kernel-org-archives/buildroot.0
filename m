From: Christian Stewart <christian@paral.in>
Date: Tue, 12 Feb 2019 01:35:29 -0800
Subject: [Buildroot] [PATCH 2/4] docker-cli: bump to v18.09.2
In-Reply-To: <20190212093531.13145-1-christian@paral.in>
References: <20190212093531.13145-1-christian@paral.in>
Message-ID: <20190212093531.13145-2-christian@paral.in>
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
index 03322a4f6d..9782f34baa 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	3e578406dead2fc72c4b52f77db39dc779fa8b460352116c06f1ae29219bd8c2  docker-cli-v18.09.0.tar.gz
+sha256	29f3a435bfcd52dbe26f6315ee92bffc0220a537608935a2c3870f6b729fc16e  docker-cli-v18.09.2.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index c73caa2652..c3dd536937 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = v18.09.0
+DOCKER_CLI_VERSION = v18.09.2
 DOCKER_CLI_SITE = $(call github,docker,cli,$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
-- 
2.19.2
