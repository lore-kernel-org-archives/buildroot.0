From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Aug 2014 18:47:23 -0300
Subject: [Buildroot] [PATCH 1/3] gnupg2: bump to version 2.0.26
Message-ID: <1409089645-23216-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnupg2/gnupg2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 5e108d9..33b5bc0 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.0.25
+GNUPG2_VERSION = 2.0.26
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
-- 
1.8.5.5
