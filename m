From: Christian Stewart <christian@paral.in>
Date: Fri, 22 Jul 2016 13:52:58 -0700
Subject: [Buildroot] [PATCH v9 1/2] package/docker-containerd: bump to latest
Message-ID: <1469220779-31430-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the pinned docker-containerd version to the latest in advance
of the introduction of docker-engine v1.12.0-rc4.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index a4a427d..ec9c13e 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 bdfa54c94f3de901a7983dc0bc924dd2268e9a5f5fe920d27bfdafad60958522  docker-containerd-1b3a81545ca79456086dc2aa424357be98b962ee.tar.gz
+sha256 5c1bcd8e3b7bc6034e7523b6eca7de974562b7fdc72c440494234ae10a0e545b  docker-containerd-0ac3cd1be170d180b2baed755e8f0da547ceb267.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 7628fe1..b1acd44 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1b3a81545ca79456086dc2aa424357be98b962ee
+DOCKER_CONTAINERD_VERSION = 0ac3cd1be170d180b2baed755e8f0da547ceb267
 DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
-- 
2.7.3
