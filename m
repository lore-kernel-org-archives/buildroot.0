From: Christian Stewart <christian@paral.in>
Date: Tue,  4 Feb 2020 15:17:11 -0800
Subject: [Buildroot] [PATCH v1 1/1] package/docker-containerd: bump to 1.2.12
Message-ID: <20200204231711.38205-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

containerd is now a separate CNCF sponsored project, and is no longer explicitly
associated with docker/moby.

This commit bumps to the latest bugfix release for 1.2.x.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-containerd/docker-containerd.hash | 4 ++--
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index aad74089e9..a4acc17710 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	6a4192fced10c390373adfa9fa9a4f12fe9f38bde580d90468a79ed6c8af75ee  docker-containerd-1.2.11.tar.gz
-sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
+sha256 318886ea1efdec36f088fd6a0a0fe2b2f0ebdfd0066bdb4bd284bad12abc0a41  docker-containerd-1.2.12.tar.gz
+sha256 4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 69068e44f8..67de8d7468 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.2.11
+DOCKER_CONTAINERD_VERSION = 1.2.12
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.25.0
