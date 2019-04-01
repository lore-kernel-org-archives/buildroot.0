From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  1 Apr 2019 20:23:51 +0200
Subject: [Buildroot] [PATCH 7/7] package/docker-cli: bump to version v18.09.4
In-Reply-To: <20190401182352.26342-1-peter@korsgaard.com>
References: <20190401182352.26342-1-peter@korsgaard.com>
Message-ID: <20190401182352.26342-8-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 9782f34baa..41686f0de8 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	29f3a435bfcd52dbe26f6315ee92bffc0220a537608935a2c3870f6b729fc16e  docker-cli-v18.09.2.tar.gz
+sha256	f9be44f395617f3f75faac69ad90f93c94ee4050c193bfa05eddb520a27c5d44  docker-cli-v18.09.4.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index c3dd536937..65701d1530 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = v18.09.2
+DOCKER_CLI_VERSION = v18.09.4
 DOCKER_CLI_SITE = $(call github,docker,cli,$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
-- 
2.11.0
