From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 6 Feb 2014 20:25:40 +0100
Subject: [Buildroot] [PATCH v4 3/3] libdrm: bump to version 2.4.52
In-Reply-To: <1391714740-1495-1-git-send-email-berndkuhls@hotmail.com>
References: <1391714740-1495-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP130FF1AD7A42F99DA40DD0FD9940@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/libdrm/libdrm.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index cecb382..5d109de 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.46
+LIBDRM_VERSION = 2.4.52
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
 LIBDRM_LICENSE = MIT
-- 
1.7.9.5
