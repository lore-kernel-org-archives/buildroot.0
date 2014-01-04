From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 14:39:04 +0100
Subject: [Buildroot] [PATCH 35/36] xorg: Bump xutil_util-macros version to
	1.18.0
In-Reply-To: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP44832CFE84CBB9F314648FAD9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5
