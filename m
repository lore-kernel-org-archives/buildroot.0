From: Christian Stewart <christian@paral.in>
Date: Mon, 19 Oct 2020 01:50:39 -0700
Subject: [Buildroot] [PATCH 2/2] package/docker-engine: bump to version
 19.03.13
In-Reply-To: <20201019085039.3429230-1-christian@paral.in>
References: <20201019085039.3429230-1-christian@paral.in>
Message-ID: <20201019085039.3429230-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2d92570b94..cc2ab8804a 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.12
+DOCKER_ENGINE_VERSION = 19.03.13
 DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.28.0
