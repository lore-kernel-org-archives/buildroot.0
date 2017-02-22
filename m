From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Feb 2017 16:46:24 +0100
Subject: [Buildroot] [PATCH 2/3] docker-containerd: bump to version
	aa8187dbd3b7ad67d8e5e3a15115d3eef43a7ed1
In-Reply-To: <1487778385-98470-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1487778385-98470-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <1487778385-98470-2-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version bump as a dependency of docker-engine v1.13.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.5.0
