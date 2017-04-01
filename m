From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Apr 2017 15:50:46 +0200
Subject: [Buildroot] [PATCH 2/3] docker-containerd: bump to version
	4ab9917febca54791c5f071a9d1f404867857fcc
In-Reply-To: <1491054647-4812-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1491054647-4812-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <1491054647-4812-2-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a runtime dependency of docker-engine in version 17.03.1-ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 7db2957..c63aca5 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256	82b103681e707a8905d0409300671ac1b221f58732d15b150160c25cf048cf26	docker-containerd-977c511eda0925a723debdc94d09459af49d082a.tar.gz
+sha256	c6a1fbc6fd6cae3b9c99bae9c349b9ccd7be8850012328ac1ebf1fe5e4b62f78	docker-containerd-4ab9917febca54791c5f071a9d1f404867857fcc.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 21b0999..c83f105 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 977c511eda0925a723debdc94d09459af49d082a
+DOCKER_CONTAINERD_VERSION = 4ab9917febca54791c5f071a9d1f404867857fcc
 DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
-- 
2.5.0
