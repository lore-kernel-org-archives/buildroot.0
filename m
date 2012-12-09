From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  9 Dec 2012 19:18:42 +0100
Subject: [Buildroot] [PATCH] matchbox-lib: fix license info
Message-ID: <1355077123-5948-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/matchbox/matchbox-lib/matchbox-lib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 7730d94..d18df6b 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -7,7 +7,7 @@
 MATCHBOX_LIB_VERSION = 1.9
 MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
 MATCHBOX_LIB_SITE = http://downloads.yoctoproject.org/releases/matchbox/libmatchbox/$(MATCHBOX_LIB_VERSION)
-MATCHBOX_LIB_LICENSE = LGPLv2.1
+MATCHBOX_LIB_LICENSE = LGPLv2.1+
 MATCHBOX_LIB_LICENSE_FILES = COPYING
 MATCHBOX_LIB_INSTALL_STAGING = YES
 MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
-- 
1.8.0.1
