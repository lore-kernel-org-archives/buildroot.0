From: Christian Stewart <christian@paral.in>
Date: Thu, 11 Aug 2016 20:58:05 -0700
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: bump to v1.12.0
Message-ID: <1470974285-19231-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump docker-engine to the latest stable v1.12.0 from v1.12.0-rc3.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 1de09f8..6078fbf 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 bc256d2a348efbf236eab991254c925fa1917dd1e29cb40586f1696f4e24852e  docker-engine-v1.12.0-rc4.tar.gz
+sha256 f8139acba98248eb1fdb0b6d94efee89b876f9a50d00e263dc144fd2b0c372d4  docker-engine-v1.12.0.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 80b0041..3d39aac 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v1.12.0-rc4
+DOCKER_ENGINE_VERSION = v1.12.0
 DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.7.3
