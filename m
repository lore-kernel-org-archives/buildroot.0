From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  2 Mar 2017 19:58:26 +0100
Subject: [Buildroot] [PATCH 2/3] docker-containerd: bump to version
	977c511eda0925a723debdc94d09459af49d082a
In-Reply-To: <1488481107-97917-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1488481107-97917-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <1488481107-97917-2-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a runtime dependency of docker-engine in version 17.03.0-ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 0505ab1..7db2957 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256	77ea44af1531d46b22f0444eb506590d1b7e5a9fe891cc6f8e36db5c2aef2d80	docker-containerd-aa8187dbd3b7ad67d8e5e3a15115d3eef43a7ed1.tar.gz
+sha256	82b103681e707a8905d0409300671ac1b221f58732d15b150160c25cf048cf26	docker-containerd-977c511eda0925a723debdc94d09459af49d082a.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 1430387..21b0999 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = aa8187dbd3b7ad67d8e5e3a15115d3eef43a7ed1
+DOCKER_CONTAINERD_VERSION = 977c511eda0925a723debdc94d09459af49d082a
 DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
-- 
2.5.0
