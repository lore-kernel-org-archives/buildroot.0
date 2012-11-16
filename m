From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 18:23:51 +0100
Subject: [Buildroot] [PATCH 02/12] xutil_util-macros: bump to version 1.17
In-Reply-To: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bbd3c5ee5865f39305160acb38ac18310b080d5b.1353086601.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by other xapp versions bump, which themselves are needed to fix
the missing link against the Xmu library (build failures similar to
http://autobuild.buildroot.org/results/1a4f84ad76ad8c4e70bff6878fc232edf46ff8f1/build-end.log).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index 7a13a61..6171c39 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.11.0
+XUTIL_UTIL_MACROS_VERSION = 1.17
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
-- 
1.7.9.5
