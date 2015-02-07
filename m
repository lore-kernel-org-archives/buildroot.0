From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:17 +0100
Subject: [Buildroot] [PATCH 04/35] package/libpciaccess: bump version to
	0.13.3
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1423339908-2960-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpciaccess/libpciaccess.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index f27925d..ade4cc6 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.13.2
+LIBPCIACCESS_VERSION = 0.13.3
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
-- 
1.7.10.4
