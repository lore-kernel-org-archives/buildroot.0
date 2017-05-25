From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 May 2017 00:45:57 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/docker-containerd: bump
	version to v0.2.8
Message-ID: <20170525224557.4601-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index a161f3bd9..fc3735f78 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256	8223d934fa767fcabf45c734bdb616818a5eab8c95d525de6a69a350f4aeb826	docker-containerd-422e31ce907fd9c3833a38d7b8fdd023e5a76e73.tar.gz
+sha256 f002d4d93a86cd3a0c9e7d9d71455a94790302daab1e51dd2dd53e7f0ba4d217  docker-containerd-v0.2.8.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index c0b001285..f8e1f5fed 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 422e31ce907fd9c3833a38d7b8fdd023e5a76e73
+DOCKER_CONTAINERD_VERSION = v0.2.8
 DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
-- 
2.11.0
