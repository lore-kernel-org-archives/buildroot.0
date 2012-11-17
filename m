From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:02:03 +0100
Subject: [Buildroot] [git commit] xutil_util-macros: bump to version 1.17
Message-ID: <20121117081559.B24449A05D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1ca198dd79bdbd9c73aa94a075e3c2e5464c010
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by other xapp versions bump, which themselves are needed to fix
the missing link against the Xmu library (build failures similar to
http://autobuild.buildroot.org/results/1a4f84ad76ad8c4e70bff6878fc232edf46ff8f1/build-end.log).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
