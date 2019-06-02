From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Jun 2019 12:45:17 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/x11r7/xapp_mkfontscale: bump
 version to 1.2.1
Message-ID: <20190602104519.7789-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash after upstream commit
https://gitlab.freedesktop.org/xorg/app/mkfontscale/commit/8609ad731b9c9c670a815c915055ae416d2396d8

Release notes:
https://lists.x.org/archives/xorg-announce/2019-March/002988.html

This version bump "now includes the mkfontdir script previously
distributed separately for compatibility with older X11 versions."

Removing the buildroot package host-xapp_mkfontdir will be done by
subsequent patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash | 12 ++++++------
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
index b0776a412b..cbcdb1700b 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002855.html
-md5 987c438e79f5ddb84a9c5726a1610819  mkfontscale-1.1.3.tar.bz2
-sha1 2fdbd7c6cc5b0678f2c5d10d2350a809d576e9e5  mkfontscale-1.1.3.tar.bz2
-sha256 1e98df69ee5f4542d711e140e1d93e2c3f2775407ccbb7849110d52b91782a6a  mkfontscale-1.1.3.tar.bz2
-sha512 509e2f9cd55cf87cc3968c8767bf3f2386016278db8b7be75b7df34bf61f52519dd2778f3b9881ffbe30cc2fe26089c0a5b2c33af46bc7727f46dad83f030a62  mkfontscale-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002988.html
+md5 215940de158b1a3d8b3f8b442c606e2f  mkfontscale-1.2.1.tar.bz2
+sha1 fb9d0458a4476a237609b676f9cebcc64b0a8a85  mkfontscale-1.2.1.tar.bz2
+sha256 ca0495eb974a179dd742bfa6199d561bda1c8da4a0c5a667f21fd82aaab6bac7  mkfontscale-1.2.1.tar.bz2
+sha512 4d243160e1f7f8dfa6a8f53349c1a42a55fc99426455ebdef58352c5e951fce8b4f1fbd1061a76c9a148095b002eac372db1ae5e2647d2ccb4886635b317b18c  mkfontscale-1.2.1.tar.bz2
 # Locally computed
-sha256 90f0a1bfee2ed42c63473ded631c0463bf38b3d193733ccfc35394c713a0701d  COPYING
+sha256 80df6f5b759f7775042313e4586506db60f26fd15b98b532cf518bd8cf1e8488  COPYING
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index a07d2f4fbd..11d9cc952f 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_MKFONTSCALE_VERSION = 1.1.3
+XAPP_MKFONTSCALE_VERSION = 1.2.1
 XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_LICENSE = MIT
-- 
2.20.1
