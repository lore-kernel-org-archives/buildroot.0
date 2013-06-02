From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  2 Jun 2013 20:28:40 -0300
Subject: [Buildroot] [PATCH 1/2] pcre: bump to version 8.33
Message-ID: <1370215721-6766-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pcre/pcre.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 745309f..066da69 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCRE_VERSION = 8.32
+PCRE_VERSION = 8.33
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_LICENSE = BSD-3c
 PCRE_LICENSE_FILES = LICENCE
-- 
1.8.1.5
