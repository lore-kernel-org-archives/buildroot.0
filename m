From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 11 Jan 2014 20:29:00 +0100
Subject: [Buildroot] [PATCH 3/6] libdrm: bump to version 2.4.51
In-Reply-To: <1389468543-6664-1-git-send-email-berndkuhls@hotmail.com>
References: <1389468543-6664-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP76B9BA3C216F89ED4D6A8D9B20@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Tested-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/libdrm/libdrm.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index dd08af1..bf0501d 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.46
+LIBDRM_VERSION = 2.4.51
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_LICENSE = MIT
-- 
1.7.10.4
