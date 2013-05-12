From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:12:59 +0200
Subject: [Buildroot] [git commit] package/x11r7: add license informations to
	xutil_* packages
Message-ID: <20130512202408.AF5FA9A164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a7ea9465cd6a0a37e6ed924549c555ba8ed10b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    2 ++
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    3 +++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index ff4d9bd..4f0e23f 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -7,6 +7,8 @@
 XUTIL_MAKEDEPEND_VERSION = 1.0.4
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.bz2
 XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
+XUTIL_MAKEDEPEND_LICENSE = MIT
+XUTIL_MAKEDEPEND_LICENSE_FILES = COPYING
 
 XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
 
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index 6171c39..08b823a 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -7,6 +7,9 @@
 XUTIL_UTIL_MACROS_VERSION = 1.17
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
+XUTIL_UTIL_MACROS_LICENSE = MIT
+XUTIL_UTIL_MACROS_LICENSE_FILES = COPYING
+
 XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
 XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
 
