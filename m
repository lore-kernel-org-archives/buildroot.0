From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 21:49:43 +0200
Subject: [Buildroot] [git commit] docker-containerd: bump to version
	422e31ce907fd9c3833a38d7b8fdd023e5a76e73
Message-ID: <20170406195000.96BE881E79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2aef84a63594456f51b30ec9c63015fc0a888aca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a runtime dependency of docker-engine in version 17.04.0-ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index c63aca5..a161f3b 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256	c6a1fbc6fd6cae3b9c99bae9c349b9ccd7be8850012328ac1ebf1fe5e4b62f78	docker-containerd-4ab9917febca54791c5f071a9d1f404867857fcc.tar.gz
+sha256	8223d934fa767fcabf45c734bdb616818a5eab8c95d525de6a69a350f4aeb826	docker-containerd-422e31ce907fd9c3833a38d7b8fdd023e5a76e73.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index c83f105..c0b0012 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 4ab9917febca54791c5f071a9d1f404867857fcc
+DOCKER_CONTAINERD_VERSION = 422e31ce907fd9c3833a38d7b8fdd023e5a76e73
 DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
