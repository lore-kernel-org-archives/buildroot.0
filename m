From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 14:40:00 +0100
Subject: [Buildroot] [git commit] package/docker-containerd: bump to version
 1.2.1
Message-ID: <20181230133551.25B23814C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff92d5d1b66b4d66873f661ba91c3ccc57aba83e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps docker-containerd to the latest tagged release, v1.2.1.

This release is compatible with the current docker engine release (18.09).

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index a530873974..52bf8e03d2 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	a946f4614d92d60361213ef18deab04ee73599e4567f1ff26f7a72841afe4fa2	docker-containerd-v1.1.3.tar.gz
+sha256	a2780aca4d72bb8aced14ca9de99bdc9a90bdaacb06c5ddd8378a66443c1d70f  docker-containerd-v1.2.1.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4	LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 121ef0939e..cc7ec0710e 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = v1.1.3
+DOCKER_CONTAINERD_VERSION = v1.2.1
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
