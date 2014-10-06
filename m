From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Oct 2014 21:28:10 +0200
Subject: [Buildroot] [PATCH 1/3] package/libva: Bump version to 1.4.0
Message-ID: <1412623692-3322-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 857cb17..984222d 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.3.1
+LIBVA_VERSION = 1.4.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
 LIBVA_LICENSE = MIT
-- 
1.7.10.4
