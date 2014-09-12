From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 11 Sep 2014 20:39:48 -0400
Subject: [Buildroot] [PATCH] google-breakpad: bump to version r1373
Message-ID: <1410482388-6143-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version adds support for installing important header files to
<staging>/usr/include/breakpad. It's no longer necessary to include the
whole breakpad source tree when building applications using libbreakpad.a.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/google-breakpad/google-breakpad.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index add5d7a..cdf0a1e 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOOGLE_BREAKPAD_VERSION = 1320
+GOOGLE_BREAKPAD_VERSION = 1373
 GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
 GOOGLE_BREAKPAD_SITE_METHOD = svn
 GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools
-- 
1.9.1
