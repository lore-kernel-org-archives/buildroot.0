From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 22:33:25 +0100
Subject: [Buildroot] [PATCH 1/8] matchbox-lib: fix license info
In-Reply-To: <cover.1356903063.git.s.martin49@gmail.com>
References: <cover.1356903063.git.s.martin49@gmail.com>
Message-ID: <d624c5b2d5dad59e45c49cc41a40266430020751.1356903063.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.8.0.3
