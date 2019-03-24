From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Mar 2019 21:14:42 +0100
Subject: [Buildroot] [PATCH 12/12] package/x11r7/xutil_makedepend: bump
 version to 1.0.6
In-Reply-To: <20190324201443.21347-1-bernd.kuhls@t-online.de>
References: <20190324201443.21347-1-bernd.kuhls@t-online.de>
Message-ID: <20190324201443.21347-12-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.hash | 9 +++++++--
 package/x11r7/xutil_makedepend/xutil_makedepend.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.hash b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
index 596551155c..1798606163 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.hash
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
@@ -1,2 +1,7 @@
-# From http://article.gmane.org/gmane.comp.freedesktop.xorg.announce/2007
-sha256	f7a80575f3724ac3d9b19eaeab802892ece7e4b0061dd6425b4b789353e25425	makedepend-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002985.html
+md5 b2ca7f2f21f1c04a88b6a254c19c9b68  makedepend-1.0.6.tar.bz2
+sha1 3f321f7b570ec98f1fabc441267d29347a2e1456  makedepend-1.0.6.tar.bz2
+sha256 d558a52e8017d984ee59596a9582c8d699a1962391b632bec3bb6804bf4d501c  makedepend-1.0.6.tar.bz2
+sha512 eb0e8ee8ab7515806d7d98a060cdcd392ec38e4225e5e05db26daa6651f185d0b764aab403edeea904d4d23211b1f7db20daeee6eafce8abe65225784ed0aa42  makedepend-1.0.6.tar.bz2
+# Locally computed
+sha256 0530078db78c47ae978dc2bd77f4f427e6cd97df868672c95b1ef284113c8cb7  COPYING
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index a50320ba93..18f8eb1f6a 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_MAKEDEPEND_VERSION = 1.0.5
+XUTIL_MAKEDEPEND_VERSION = 1.0.6
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
 XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_MAKEDEPEND_LICENSE = MIT
-- 
2.20.1
