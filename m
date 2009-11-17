From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 17 Nov 2009 11:07:58 -0600
Subject: [Buildroot] Update Ipkg address
Message-ID: <200911171111.02261.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just a minor irksome detail:

diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index 1e586ce..222ca67 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -6,7 +6,7 @@
 
 IPKG_VERSION = 0.99.163
 IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
-IPKG_SITE = http://ftp.handhelds.org/packages/ipkg
+IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
 IPKG_AUTORECONF = NO
 IPKG_INSTALL_STAGING = YES
 IPKG_INSTALL_TARGET = YES

Mike
