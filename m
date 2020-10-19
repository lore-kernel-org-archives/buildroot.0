From: Christian Stewart <christian@paral.in>
Date: Mon, 19 Oct 2020 02:15:26 -0700
Subject: [Buildroot] [PATCH 1/1] package/docker-containerd: bump to version
 1.4.1
Message-ID: <20201019091526.3767709-1-christian@paral.in>
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
index 4b32d62649..2ec3d042ba 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	d6284c69e1933e4c05fe285feebef461efe8cd2030634dcf1cbdcde46abe86be  docker-containerd-1.4.0.tar.gz
+sha256	d410b8efc94e4124990f01de7107223971be8c9258fc651decf9e0ba648485b5  docker-containerd-1.4.1.tar.gz
 sha256	4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 67060e3ff6..71f9b4c065 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.4.0
+DOCKER_CONTAINERD_VERSION = 1.4.1
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.28.0
