From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Oct 2011 12:25:21 -0300
Subject: [Buildroot] [PATCH] lsof: bump to version 4.85
Message-ID: <1318001121-2747-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ....84-makefile.patch => lsof-4.85-makefile.patch} |    0
 ...4-noportmap.patch => lsof-4.85-noportmap.patch} |    0
 ...flags.patch => lsof-4.85-override-cflags.patch} |    0
 ...tch => lsof-4.85-remove-susvlegacy-funcs.patch} |    0
 package/lsof/lsof.mk                               |    3 ++-
 5 files changed, 2 insertions(+), 1 deletions(-)
 rename package/lsof/{lsof-4.84-makefile.patch => lsof-4.85-makefile.patch} (100%)
 rename package/lsof/{lsof-4.84-noportmap.patch => lsof-4.85-noportmap.patch} (100%)
 rename package/lsof/{lsof-4.84-override-cflags.patch => lsof-4.85-override-cflags.patch} (100%)
 rename package/lsof/{lsof-4.84-remove-susvlegacy-funcs.patch => lsof-4.85-remove-susvlegacy-funcs.patch} (100%)

diff --git a/package/lsof/lsof-4.84-makefile.patch b/package/lsof/lsof-4.85-makefile.patch
similarity index 100%
rename from package/lsof/lsof-4.84-makefile.patch
rename to package/lsof/lsof-4.85-makefile.patch
diff --git a/package/lsof/lsof-4.84-noportmap.patch b/package/lsof/lsof-4.85-noportmap.patch
similarity index 100%
rename from package/lsof/lsof-4.84-noportmap.patch
rename to package/lsof/lsof-4.85-noportmap.patch
diff --git a/package/lsof/lsof-4.84-override-cflags.patch b/package/lsof/lsof-4.85-override-cflags.patch
similarity index 100%
rename from package/lsof/lsof-4.84-override-cflags.patch
rename to package/lsof/lsof-4.85-override-cflags.patch
diff --git a/package/lsof/lsof-4.84-remove-susvlegacy-funcs.patch b/package/lsof/lsof-4.85-remove-susvlegacy-funcs.patch
similarity index 100%
rename from package/lsof/lsof-4.84-remove-susvlegacy-funcs.patch
rename to package/lsof/lsof-4.85-remove-susvlegacy-funcs.patch
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 547382f..ff76f92 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -3,7 +3,8 @@
 # lsof
 #
 #############################################################
-LSOF_VERSION = 4.84
+
+LSOF_VERSION = 4.85
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
 LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 
-- 
1.7.3.4
