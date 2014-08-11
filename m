From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 11 Aug 2014 20:59:43 +0200
Subject: [Buildroot] [PATCH] package/exim: Bump version to 4.84
Message-ID: <1407783584-24072-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 845c5f8..f6016fa 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.83
+EXIM_VERSION = 4.84
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
-- 
1.7.10.4
