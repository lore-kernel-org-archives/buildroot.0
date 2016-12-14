From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 00:03:59 +0100
Subject: [Buildroot] [PATCH] docker-engine: security bump to 1.12.3
Message-ID: <20161214230359.32103-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-8867: https://forums.docker.com/t/docker-1-12-2-security-advisory/23975

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 13e28bd..ecc5c66 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 29bc203e483c81c9a337b4a4186e6b0a23984c518b09478d8718c616b5923e88  docker-engine-v1.12.2.tar.gz
+sha256 cf4f876593abde06b4c19f971163a853a21b1992d75bd2fe5d8bea9015b09f87  docker-engine-v1.12.3.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 7b5a8a4..fdb3c07 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v1.12.2
+DOCKER_ENGINE_VERSION = v1.12.3
 DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.10.2
