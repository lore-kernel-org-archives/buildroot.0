From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 21:49:21 +0200
Subject: [Buildroot] [git commit] cryptsetup: bump to version 1.6.8
Message-ID: <20151002195300.4CBE881914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e24dfe8ba2127e507371a64b96b66e4b39711ff0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.hash |    2 +-
 package/cryptsetup/cryptsetup.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index a418081..a0b975d 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/sha256sums.asc
-sha256	c23c24c8d662032da8650c1c84985221be8bbedf4737c1540bba7e4517dfe820	cryptsetup-1.6.7.tar.xz
+sha256	45a6ccd3c65b7d904e58e1cb3656a7e997190b6a05b5ff7c6887e4a41c5f19bc	cryptsetup-1.6.8.tar.xz
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 3655d5d..78cbe8f 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 1.6
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).7
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).8
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
