From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 16:34:05 -0300
Subject: [Buildroot] [PATCH 1/2] socat: security bump to version 2.0.0-b7
Message-ID: <1394480046-3187-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-0019.
Also rename patch according to policy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{socat-no-documentation.patch => socat-001-no-documentation.patch}  | 0
 package/socat/socat.mk                                                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename package/socat/{socat-no-documentation.patch => socat-001-no-documentation.patch} (100%)

diff --git a/package/socat/socat-no-documentation.patch b/package/socat/socat-001-no-documentation.patch
similarity index 100%
rename from package/socat/socat-no-documentation.patch
rename to package/socat/socat-001-no-documentation.patch
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index df60961..6ae67a9 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 2.0.0-b6
+SOCAT_VERSION = 2.0.0-b7
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download/
 SOCAT_LICENSE = GPLv2
-- 
1.8.3.2
