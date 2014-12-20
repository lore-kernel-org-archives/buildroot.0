From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Dec 2014 10:34:31 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/libdvbcsa: Update SITE url
Message-ID: <1419068072-7779-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

old SITE is now password-protected

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added patch description (Peter)

 package/libdvbcsa/libdvbcsa.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdvbcsa/libdvbcsa.mk b/package/libdvbcsa/libdvbcsa.mk
index ef1d957..1472537 100644
--- a/package/libdvbcsa/libdvbcsa.mk
+++ b/package/libdvbcsa/libdvbcsa.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBDVBCSA_VERSION = 1.1.0
-LIBDVBCSA_SITE = http://download.videolan.org/pub/videolan/libdvbcsa/$(LIBDVBCSA_VERSION)
+LIBDVBCSA_SITE = http://get.videolan.org/libdvbcsa/$(LIBDVBCSA_VERSION)
 LIBDVBCSA_LICENSE = GPLv2+
 LIBDVBCSA_LICENSE_FILES = COPYING
 LIBDVBCSA_INSTALL_STAGING = YES
-- 
1.7.10.4
