From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 31 Jul 2019 10:24:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/libshout: move site to https
Message-ID: <20190731082447.3441-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move site from http to https as HTTP URL now returns
"301 Moved Permanently"

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libshout/libshout.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 4f209081a4..375ce05b4b 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSHOUT_VERSION = 2.4.1
-LIBSHOUT_SITE = http://downloads.xiph.org/releases/libshout
+LIBSHOUT_SITE = https://downloads.xiph.org/releases/libshout
 LIBSHOUT_LICENSE = LGPL-2.0+
 LIBSHOUT_LICENSE_FILES = COPYING
 LIBSHOUT_INSTALL_STAGING = YES
-- 
2.20.1
