From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 23:30:21 +0100
Subject: [Buildroot] [git commit] xorg: Bump xutil_util-macros version to
	1.18.0
Message-ID: <20140105230943.171FC9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7b9008f9a077fdfad527afc72c6e9311cc2fa13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index f2656c2..1d73255 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.17
+XUTIL_UTIL_MACROS_VERSION = 1.18.0
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_LICENSE = MIT
