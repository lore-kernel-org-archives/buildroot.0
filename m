From: Christian Stewart <christian@paral.in>
Date: Tue, 10 Mar 2020 04:18:20 -0700
Subject: [Buildroot] [PATCH 1/2] package/docker-containerd: bump version to
 1.2.13
Message-ID: <20200310111821.197036-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index a4acc17710..95288be58b 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256 318886ea1efdec36f088fd6a0a0fe2b2f0ebdfd0066bdb4bd284bad12abc0a41  docker-containerd-1.2.12.tar.gz
+sha256	0811057ab67b78ce911416e793edaeb14b3f1e105d67b8e67b6302e0eab572e4  docker-containerd-1.2.13.tar.gz
 sha256 4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 67de8d7468..5a44489065 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.2.12
+DOCKER_CONTAINERD_VERSION = 1.2.13
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.25.1
