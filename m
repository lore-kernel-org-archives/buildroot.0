From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 09:47:31 +0200
Subject: [Buildroot] [git commit] docker-engine: bump to v1.12.2
Message-ID: <20161019075444.04E5C8041A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd73cac9d57dc8583bc810902596e0b59cc7ed75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 6078fbf..13e28bd 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f8139acba98248eb1fdb0b6d94efee89b876f9a50d00e263dc144fd2b0c372d4  docker-engine-v1.12.0.tar.gz
+sha256 29bc203e483c81c9a337b4a4186e6b0a23984c518b09478d8718c616b5923e88  docker-engine-v1.12.2.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 3d39aac..f895dcc 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v1.12.0
+DOCKER_ENGINE_VERSION = v1.12.2
 DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
