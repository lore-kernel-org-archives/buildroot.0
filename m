From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2015 22:37:24 +0100
Subject: [Buildroot] [git commit] kmod: bump version to 22
Message-ID: <20151201232122.2D07081945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e6ca919f1167415f0ffb690570a8e8e980c5714
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index cf7e802..75b819e 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  89c1a1a2193c31f9ebe582640bfa2bd401341dc24119f5a7f702588116fadaa0  kmod-20.tar.xz
+sha256  ba3b1ddea33228b473189fcb05b809024a3b86e9a7cf37d420cae06beb749f82  kmod-22.tar.xz
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 3742a03..2b9d002 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 20
+KMOD_VERSION = 22
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
