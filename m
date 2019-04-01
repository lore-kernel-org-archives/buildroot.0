From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  1 Apr 2019 20:23:48 +0200
Subject: [Buildroot] [PATCH 4/7] package/docker-containerd: bump version to
 v1.2.5
In-Reply-To: <20190401182352.26342-1-peter@korsgaard.com>
References: <20190401182352.26342-1-peter@korsgaard.com>
Message-ID: <20190401182352.26342-5-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Contains a number of bugfixes. For more details, see the announcement:

https://github.com/containerd/containerd/releases/tag/v1.2.5

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index cae88f40e2..fc7b6fcb49 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	ff4c2ad680c9e2484e335868a54b0c1ea49d9165dd5b38b64ef7d9dacf2b96b4  docker-containerd-v1.2.3.tar.gz
+sha256	b92819bde71de947329814a3c649b8adb106cc03be16aae217b94297f4b843a1  docker-containerd-v1.2.5.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4	LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 9088c17660..586fd1fa08 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = v1.2.3
+DOCKER_CONTAINERD_VERSION = v1.2.5
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.11.0
