From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 22:16:27 +0200
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xkbcomp:
	bump version to 1.4.0
Message-ID: <20170511201644.A3AE38291D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3598a98d31e06dcb8940a58a45b8a220e7f7641
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash | 7 +++++--
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
index bc85caa..4d0b5fe 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -1,2 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-November/002653.html
-sha256	0304dc9e0d4ac10831a9ef5d5419722375ddbc3eac3ff4413094d57bc1f1923d	xkbcomp-1.3.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-May/002797.html
+md5 cc22b232bc78a303371983e1b48794ab  xkbcomp-1.4.0.tar.bz2
+sha1 9578a564ff8fcf96581fb52860828fbab8c67b4f  xkbcomp-1.4.0.tar.bz2
+sha256 bc69c8748c03c5ad9afdc8dff9db11994dd871b614c65f8940516da6bf61ce6b  xkbcomp-1.4.0.tar.bz2
+sha512 c96a63fc2d9a6ac17123297574966c45d0dcfd4ae3d4073ce863c7738d453f4c0a5f7a87c06efdec19f0b270207a7170fe1aa72a73ef1b50f95c7ca262f4882e  xkbcomp-1.4.0.tar.bz2
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 4fc4372..cc88561 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBCOMP_VERSION = 1.3.1
+XAPP_XKBCOMP_VERSION = 1.4.0
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
