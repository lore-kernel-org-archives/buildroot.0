From: Christian Stewart <christian@paral.in>
Date: Wed, 16 Dec 2020 00:00:11 -0800
Subject: [Buildroot] [PATCH 4/5] package/docker-cli: bump version to 20.10.1
In-Reply-To: <20201216080013.547261-1-christian@paral.in>
References: <20201216080013.547261-1-christian@paral.in>
Message-ID: <20201216080013.547261-4-christian@paral.in>
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
index 66abfe5224..4e14b5212a 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	21b88a00e8f7a3194c0ae1de5a31e3e1728ef6aa2804158dcb502a8b5fd6ae2b  docker-cli-19.03.13.tar.gz
+sha256  4ee7cc9c3f6287ca834166aaa1a945790c54d9a8345a1b449a193d9c739f2a7d  docker-cli-20.10.1.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 86fffafdb8..0d1ec02ad7 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 19.03.13
+DOCKER_CLI_VERSION = 20.10.1
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.28.0
