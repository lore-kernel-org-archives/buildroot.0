From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 09:15:19 +0100
Subject: [Buildroot] [git commit] docker-engine: bump version to v1.12.5
Message-ID: <20161223081610.928247F90B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eddce6ea04a752388bec22a623320290a5834b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index ecc5c66..6697d8a 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 cf4f876593abde06b4c19f971163a853a21b1992d75bd2fe5d8bea9015b09f87  docker-engine-v1.12.3.tar.gz
+sha256 81b337368efafb631a75f6ad5469413fd5828ce672592c374adf894dc05abd38  docker-engine-v1.12.5.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index fdb3c07..ade6fbb 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v1.12.3
+DOCKER_ENGINE_VERSION = v1.12.5
 DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
