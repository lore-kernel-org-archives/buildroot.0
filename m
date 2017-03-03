From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 23:52:42 +0100
Subject: [Buildroot] [git commit] docker-containerd: bump to version
	977c511eda0925a723debdc94d09459af49d082a
Message-ID: <20170303225251.AF34081909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68793184f557ccf2989ad6c1c89b1d943bb9b866
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a runtime dependency of docker-engine in version 17.03.0-ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
