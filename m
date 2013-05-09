From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 17:51:00 +0200
Subject: [Buildroot] [PATCH 05/12] package/x11r7: add license informations
	to xutil_* packages
In-Reply-To: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368114667-14476-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368114667-14476-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    2 ++
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    3 +++
 2 files changed, 5 insertions(+)

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
 
-- 
1.7.9.5
