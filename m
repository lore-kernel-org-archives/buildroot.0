From: Christian Stewart <christian@paral.in>
Date: Thu, 22 Dec 2016 23:37:01 -0800
Subject: [Buildroot] [PATCH 1/2] docker-containerd: bump version to v0.2.5
Message-ID: <20161223073702.17480-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version bump as a dependency of Docker-Engine v1.12.5.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 533157e..f27e38e 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 34805aef6300fbf37adcf4362a2315fac1ea57a9ceb8b0c7b1a0859cba975428  docker-containerd-v0.2.4.tar.gz
+sha256 88e099af66b50abe7f2159f13bdab793fa5199d8d5b9a9ef7a68171abb4359be  docker-containerd-v0.2.5.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 17cc9be..c04552a 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = v0.2.4
+DOCKER_CONTAINERD_VERSION = v0.2.5
 DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
-- 
2.10.2
