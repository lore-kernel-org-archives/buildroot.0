From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:13 +0200
Subject: [Buildroot] [PATCH 44/69] xfont_font-util: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-45-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xfont_font-util/xfont_font-util.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 1c43d6a70666..36853770ef14 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -11,6 +11,7 @@ XFONT_FONT_UTIL_LICENSE = MIT/BSD-2c
 XFONT_FONT_UTIL_LICENSE_FILES = COPYING
 
 XFONT_FONT_UTIL_DEPENDENCIES = host-pkgconf
+HOST_XFONT_FONT_UTIL_DEPENDENCIES = host-pkgconf
 XFONT_FONT_UTIL_INSTALL_STAGING = YES
 XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
-- 
2.1.0
