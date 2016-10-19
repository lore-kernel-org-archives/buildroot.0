From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 09:46:54 +0200
Subject: [Buildroot] [git commit] docker-containerd: bump to v0.2.4
Message-ID: <20161019075444.00308800D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fef19b44f1c15680836b6eaf0e71c2048a592138
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
