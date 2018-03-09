From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 22:59:57 +0100
Subject: [Buildroot] [git commit] package/libuv: bump version to 1.19.2
Message-ID: <20180309221057.D826C828C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d2dbca68b32ec040ecd00728f3e2b9bfc484222
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index cc5a30ae10..1a2833e786 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8d96a6230af4f9f33d6ec021b599e157279a2af72ed38cf4a8c25e6d58d952ef  libuv-v1.19.1.tar.gz
+sha256  ccc5f3b43ed171640513786e5e809508cb6308279b4d71a016e4550ad62f1686  libuv-v1.19.2.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 2666c14f93..2e07d3a0fa 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.19.1
+LIBUV_VERSION = v1.19.2
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
