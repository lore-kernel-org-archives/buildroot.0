From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2015 23:21:16 -0000
Subject: [Buildroot] [git commit] cryptsetup: bump to version 1.7.0
Message-ID: <20151201232115.B432F8220E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f11f5d541abe6628c50bf7e0a3999dc6e8914e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index a0b975d..e770f95 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/sha256sums.asc
-sha256	45a6ccd3c65b7d904e58e1cb3656a7e997190b6a05b5ff7c6887e4a41c5f19bc	cryptsetup-1.6.8.tar.xz
+sha256	075524a7cc0db36d12119fa79116750accb1c6c8825d5faa2534b74b8ce3d148	cryptsetup-1.7.0.tar.xz
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 78cbe8f..986b131 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION_MAJOR = 1.6
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).8
+CRYPTSETUP_VERSION_MAJOR = 1.7
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
