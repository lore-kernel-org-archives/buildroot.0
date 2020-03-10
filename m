From: Christian Stewart <christian@paral.in>
Date: Tue, 10 Mar 2020 04:18:21 -0700
Subject: [Buildroot] [PATCH 2/2] package/docker-engine: bump version to
 19.03.7
In-Reply-To: <20200310111821.197036-1-christian@paral.in>
References: <20200310111821.197036-1-christian@paral.in>
Message-ID: <20200310111821.197036-2-christian@paral.in>
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
index 1f1643d377..4c031574af 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	bc5d1ac503e44593be8003ed0ad9c75bf0da535db19837a9338429c438bd4637  docker-engine-19.03.5.tar.gz
+sha256	6621da5b75cecd1f6f57389a4611d3dd00eeedd8765db63ae5538122fdac27da  docker-engine-19.03.7.tar.gz
 sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index eb3a7fd29f..df27cb17b5 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.5
+DOCKER_ENGINE_VERSION = 19.03.7
 DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.25.1
