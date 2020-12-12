From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Dec 2020 11:05:12 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/docker-containerd: bump to version 1.4.0
Message-ID: <20201212103032.7671780E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6de54d16bc0e611babb06fedd9baa8429b7838f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 04b2afc65bdb9c1c0c3435e08710adc7cd231016)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/docker-containerd.hash | 4 ++--
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 6fbb228ed2..4b32d62649 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	80ea55655612d7d9f9e8e10df5993a3636b088390e1a372962687d70ef265d97  docker-containerd-1.2.14.tar.gz
-sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
+sha256	d6284c69e1933e4c05fe285feebef461efe8cd2030634dcf1cbdcde46abe86be  docker-containerd-1.4.0.tar.gz
+sha256	4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 64cb086fef..c16db6518e 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.2.14
+DOCKER_CONTAINERD_VERSION = 1.4.0
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
