From: Christian Stewart <christian@paral.in>
Date: Sat, 12 Sep 2020 17:16:55 -0700
Subject: [Buildroot] [PATCH v1 2/5] package/docker-containerd: bump to
 version 1.4.0
In-Reply-To: <20200913001659.472814-1-christian@paral.in>
References: <20200913001659.472814-1-christian@paral.in>
Message-ID: <20200913001659.472814-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-containerd/docker-containerd.hash | 4 ++--
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 95288be58b..4b32d62649 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	0811057ab67b78ce911416e793edaeb14b3f1e105d67b8e67b6302e0eab572e4  docker-containerd-1.2.13.tar.gz
-sha256 4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
+sha256	d6284c69e1933e4c05fe285feebef461efe8cd2030634dcf1cbdcde46abe86be  docker-containerd-1.4.0.tar.gz
+sha256	4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 904fa424b8..67060e3ff6 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.2.13
+DOCKER_CONTAINERD_VERSION = 1.4.0
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.28.0
