From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 15:05:56 +0100
Subject: [Buildroot] [git commit] docker-containerd: bump to version
	aa8187dbd3b7ad67d8e5e3a15115d3eef43a7ed1
Message-ID: <20170301170424.224217FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0d6b5f9e4f3771b0f7eaa7b01ff7d6770c16d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version bump as a dependency of docker-engine v1.13.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index f27e38e..0505ab1 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 88e099af66b50abe7f2159f13bdab793fa5199d8d5b9a9ef7a68171abb4359be  docker-containerd-v0.2.5.tar.gz
+sha256	77ea44af1531d46b22f0444eb506590d1b7e5a9fe891cc6f8e36db5c2aef2d80	docker-containerd-aa8187dbd3b7ad67d8e5e3a15115d3eef43a7ed1.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index c04552a..1430387 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = v0.2.5
+DOCKER_CONTAINERD_VERSION = aa8187dbd3b7ad67d8e5e3a15115d3eef43a7ed1
 DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
