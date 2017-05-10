From: Christian Stewart <christian@paral.in>
Date: Wed, 10 May 2017 00:00:50 -0400
Subject: [Buildroot] [PATCH 2/2] docker-engine: bump to version 17.05.0-ce
In-Reply-To: <20170510040050.31744-1-christian@paral.in>
References: <20170510040050.31744-1-christian@paral.in>
Message-ID: <20170510040050.31744-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index aa7c3ac..6c0ed33 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	b6ee0aa93ecea44e956d3627907e10557b3ec37d13ddfb40e436656e5037c640	docker-engine-v17.04.0-ce.tar.gz
+sha256	4716df117d867b82ddab2e82395cd40aa3d0925a689eedcec8919729e4c9f121	docker-engine-v17.05.0-ce.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c4c1157..831b586 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v17.04.0-ce
-DOCKER_ENGINE_COMMIT = 4845c567eb35d68f35b0b1713a09b0c8d47fe67e
+DOCKER_ENGINE_VERSION = v17.05.0-ce
+DOCKER_ENGINE_COMMIT = 89658bed64c2a8fe05a978e5b87dbec409d57a0f
 DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.10.2
