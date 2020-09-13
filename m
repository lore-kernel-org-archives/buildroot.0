From: Christian Stewart <christian@paral.in>
Date: Sat, 12 Sep 2020 17:16:58 -0700
Subject: [Buildroot] [PATCH v1 5/5] package/docker-proxy: bump to latest
 commit hash 6d6f28
In-Reply-To: <20200913001659.472814-1-christian@paral.in>
References: <20200913001659.472814-1-christian@paral.in>
Message-ID: <20200913001659.472814-5-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

docker network library has not published a release, take the latest master
branch commit hash.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-proxy/docker-proxy.hash | 4 ++--
 package/docker-proxy/docker-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
index 4fa9541bed..9f63fa2834 100644
--- a/package/docker-proxy/docker-proxy.hash
+++ b/package/docker-proxy/docker-proxy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0fffcd438b9a87a7ff8315364ff4631d2241ac0cf9f9f83871aeafcb2a383fd1  docker-proxy-feeff4f0a3fd2a2bb19cf67c826082c66ffaaed9.tar.gz
-sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14	LICENSE
+sha256	c68d09e47dc1dbe27c93e121959be5f0c6cfe47940efe81e3465cb438e9ef625  docker-proxy-6d6f28a1b61b6dd0ad562277d19592125428ed4e.tar.gz
+sha256	cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index bd8a3d0f17..392e5f1b59 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_PROXY_VERSION = feeff4f0a3fd2a2bb19cf67c826082c66ffaaed9
+DOCKER_PROXY_VERSION = 6d6f28a1b61b6dd0ad562277d19592125428ed4e
 DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
 
 DOCKER_PROXY_LICENSE = Apache-2.0
-- 
2.28.0
