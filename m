From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:21:30 +0100
Subject: [Buildroot] [git commit branch/next] docker-containerd: bump to
 v1.2.3
Message-ID: <20190213214530.F3B0A8A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f51e3a50041eb18604b81c18c146d97cdb0afd35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 52bf8e03d2..cae88f40e2 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	a2780aca4d72bb8aced14ca9de99bdc9a90bdaacb06c5ddd8378a66443c1d70f  docker-containerd-v1.2.1.tar.gz
+sha256	ff4c2ad680c9e2484e335868a54b0c1ea49d9165dd5b38b64ef7d9dacf2b96b4  docker-containerd-v1.2.3.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4	LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 12f2324a8c..9088c17660 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = v1.2.1
+DOCKER_CONTAINERD_VERSION = v1.2.3
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
