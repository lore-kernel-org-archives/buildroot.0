From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:42:55 +0200
Subject: [Buildroot] [git commit] docker-containerd: bump to version
	9048e5e50717ea4497b757314bad98ea3763c145
Message-ID: <20170612080950.A83F97FDDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d445d7d7b4027231f772b02bc0e4d86af545c356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a runtime dependency of docker-engine in version 17.05.0-ce

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index a161f3b..992eb5b 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256	8223d934fa767fcabf45c734bdb616818a5eab8c95d525de6a69a350f4aeb826	docker-containerd-422e31ce907fd9c3833a38d7b8fdd023e5a76e73.tar.gz
+sha256	da89086a7c643702a2ddecec67a45d3d8e4b0d610dd19036be63e6bd54cc1a85	docker-containerd-9048e5e50717ea4497b757314bad98ea3763c145.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index c0b0012..bf3e32d 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 422e31ce907fd9c3833a38d7b8fdd023e5a76e73
+DOCKER_CONTAINERD_VERSION = 9048e5e50717ea4497b757314bad98ea3763c145
 DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
