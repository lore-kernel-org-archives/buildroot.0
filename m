From: Christian Stewart <christian@paral.in>
Date: Mon, 11 May 2020 12:54:02 -0700
Subject: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version to
 19.03.8
Message-ID: <20200511195403.557773-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 4c031574af..c23eea90a8 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	6621da5b75cecd1f6f57389a4611d3dd00eeedd8765db63ae5538122fdac27da  docker-engine-19.03.7.tar.gz
+sha256	13ec45ad45091111bd566aca9d81989b3f05e0625dab68d33c3ad81ff924172f  docker-engine-19.03.8.tar.gz
 sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index df27cb17b5..78f6c1261c 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.7
+DOCKER_ENGINE_VERSION = 19.03.8
 DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.26.2
