From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Dec 2011 09:39:19 -0300
Subject: [Buildroot] [PATCH] proftpd: security bump to version 1.3.3g
Message-ID: <1323434359-9752-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Security bump version to 1.3.3g, fix for CVE-2011-4130

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ....3g-fix-kernel-header-capability-version.patch} |    0
 package/proftpd/proftpd.mk                         |    3 ++-
 2 files changed, 2 insertions(+), 1 deletions(-)
 rename package/proftpd/{proftpd-1.3.3e-fix-kernel-header-capability-version.patch => proftpd-1.3.3g-fix-kernel-header-capability-version.patch} (100%)

diff --git a/package/proftpd/proftpd-1.3.3e-fix-kernel-header-capability-version.patch b/package/proftpd/proftpd-1.3.3g-fix-kernel-header-capability-version.patch
similarity index 100%
rename from package/proftpd/proftpd-1.3.3e-fix-kernel-header-capability-version.patch
rename to package/proftpd/proftpd-1.3.3g-fix-kernel-header-capability-version.patch
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 2523dd2..5352ea7 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -3,7 +3,8 @@
 # proftpd
 #
 #############################################################
-PROFTPD_VERSION = 1.3.3e
+
+PROFTPD_VERSION = 1.3.3g
 PROFTPD_SOURCE = proftpd-$(PROFTPD_VERSION).tar.bz2
 PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source/
 
-- 
1.7.3.4
