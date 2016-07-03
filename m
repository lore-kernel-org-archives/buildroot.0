From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:33:18 +0200
Subject: [Buildroot] [git commit] xfont_font-util: add explicit dependencies
	for host variant
Message-ID: <20160703073819.1B75A80288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8b7ed2cac596fb227d39c25f909d9e6917302f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xfont_font-util/xfont_font-util.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 1c43d6a..3685377 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -11,6 +11,7 @@ XFONT_FONT_UTIL_LICENSE = MIT/BSD-2c
 XFONT_FONT_UTIL_LICENSE_FILES = COPYING
 
 XFONT_FONT_UTIL_DEPENDENCIES = host-pkgconf
+HOST_XFONT_FONT_UTIL_DEPENDENCIES = host-pkgconf
 XFONT_FONT_UTIL_INSTALL_STAGING = YES
 XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
