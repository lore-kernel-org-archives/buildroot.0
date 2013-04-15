From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 23:48:14 +0200
Subject: [Buildroot] [git commit] kmod: add license information
Message-ID: <20130415215907.A628E9B6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28a7f942ae5683e8eb0f18ed565723d5949fcb91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index c0b223d..5c733b9 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -1,6 +1,14 @@
+#############################################################
+#
+# kmod
+#
+#############################################################
+
 KMOD_VERSION = 13
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
+KMOD_LICENSE = GPLv2+ LGPLv2.1+
+KMOD_LICENSE_FILES = COPYING libkmod/COPYING
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
 
