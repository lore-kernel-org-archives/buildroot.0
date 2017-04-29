From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 19:38:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsquish: fix legal-info
Message-ID: <20170429173805.25690-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/4f8/4f81644ca2e0ec4064f43c6cb00f2d5c858bbf77/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsquish/libsquish.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
index 9b447b0d8..67892dd9e 100644
--- a/package/libsquish/libsquish.mk
+++ b/package/libsquish/libsquish.mk
@@ -10,7 +10,7 @@ LIBSQUISH_SITE = http://downloads.sourceforge.net/project/libsquish
 LIBSQUISH_INSTALL_STAGING = YES
 LIBSQUISH_STRIP_COMPONENTS = 0
 LIBSQUISH_LICENSE = MIT
-LIBSQUISH_LICENSE_FILES = README
+LIBSQUISH_LICENSE_FILES = LICENSE.txt
 
 define LIBSQUISH_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-- 
2.11.0
