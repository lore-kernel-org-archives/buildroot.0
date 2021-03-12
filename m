From: Christian Stewart <christian@paral.in>
Date: Fri, 12 Mar 2021 14:48:33 -0800
Subject: [Buildroot] [PATCH 3/3] package/docker-engine: bump version to
 20.10.5
In-Reply-To: <20210312224833.1908386-1-christian@paral.in>
References: <20210312224833.1908386-1-christian@paral.in>
Message-ID: <20210312224833.1908386-3-christian@paral.in>
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
index 69ebd113ea..7e3ce6a5cf 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  62bb03f197b8a064da568e62639f6834f91c8cfc9273126a978847becc214c31  docker-engine-20.10.3.tar.gz
+sha256  bcf651d75e5c80421e8cd3b0d47f3425e01047cf67aef0eda83b68776905a583  docker-engine-20.10.5.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index bbc97af8b5..d3f4d81572 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.3
+DOCKER_ENGINE_VERSION = 20.10.5
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.30.2
