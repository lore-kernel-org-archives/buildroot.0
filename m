From: Christian Stewart <christian@paral.in>
Date: Wed, 19 Oct 2016 00:53:24 -0400
Subject: [Buildroot] [PATCH 2/3] docker-containerd: bump to v0.2.4
In-Reply-To: <1476852805-11450-1-git-send-email-christian@paral.in>
References: <1476852805-11450-1-git-send-email-christian@paral.in>
Message-ID: <1476852805-11450-2-git-send-email-christian@paral.in>
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
index ec9c13e..533157e 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 5c1bcd8e3b7bc6034e7523b6eca7de974562b7fdc72c440494234ae10a0e545b  docker-containerd-0ac3cd1be170d180b2baed755e8f0da547ceb267.tar.gz
+sha256 34805aef6300fbf37adcf4362a2315fac1ea57a9ceb8b0c7b1a0859cba975428  docker-containerd-v0.2.4.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 06432e9..17cc9be 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 0ac3cd1be170d180b2baed755e8f0da547ceb267
+DOCKER_CONTAINERD_VERSION = v0.2.4
 DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
-- 
2.7.3
