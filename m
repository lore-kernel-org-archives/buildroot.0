From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 18:39:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/oprofile: fix typo in comment
Message-ID: <1453570744-8930-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/oprofile/oprofile.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index c73086e..f27e06e 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -41,7 +41,7 @@ ifeq ($(BR2_PACKAGE_LIBPFM4),y)
 OPROFILE_DEPENDENCIES += libpfm4
 endif
 
-# When getext is enabled, popt links with -lintl, specifies it in its
+# When gettext is enabled, popt links with -lintl, specifies it in its
 # popt.pc and has done so for the past 6+ years. But oprofile does not
 # use pkconfig to find popt, so misses -lintl, which is important for
 # a static build. We have to do the call to pkgconfig manually...
-- 
2.7.0.rc3
