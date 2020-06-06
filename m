From: Christian Stewart <christian@paral.in>
Date: Sat,  6 Jun 2020 14:09:52 -0700
Subject: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump to version
 19.03.11
Message-ID: <20200606210953.131088-1-christian@paral.in>
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
index c23eea90a8..99159f9376 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	13ec45ad45091111bd566aca9d81989b3f05e0625dab68d33c3ad81ff924172f  docker-engine-19.03.8.tar.gz
+sha256	5ff62d7b3638a275b2c459e53a4d1a7a8fb03dde8305defcd55e05e059e5618d  docker-engine-19.03.11.tar.gz
 sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 78f6c1261c..2f622014ba 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.8
+DOCKER_ENGINE_VERSION = 19.03.11
 DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.27.0
