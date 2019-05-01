From: Christian Stewart <christian@paral.in>
Date: Wed,  1 May 2019 11:48:59 -0700
Subject: [Buildroot] [PATCH v1 2/4] package/docker-containerd: bump to
 version 1.2.6
In-Reply-To: <20190501184901.29441-1-christian@paral.in>
References: <20190501184901.29441-1-christian@paral.in>
Message-ID: <20190501184901.29441-2-christian@paral.in>
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
index fc7b6fcb49..525191c651 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	b92819bde71de947329814a3c649b8adb106cc03be16aae217b94297f4b843a1  docker-containerd-v1.2.5.tar.gz
+sha256	f2d578b743fb9faa5b3477b7cf4b33d00501087043a53b27754f14bbe741f891  docker-containerd-v1.2.6.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4	LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 586fd1fa08..c67b36e7dc 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = v1.2.5
+DOCKER_CONTAINERD_VERSION = v1.2.6
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.21.0
