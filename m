From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 4 Feb 2014 19:15:21 +0100
Subject: [Buildroot] [PATCH v2 3/7] libdrm: bump to version 2.4.52
In-Reply-To: <1391537725-15894-1-git-send-email-berndkuhls@hotmail.com>
References: <1391537725-15894-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP299ADEC0294DF6BF6186D06D9AA0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
v2: bump to version 2.4.52

 package/libdrm/libdrm.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index dd08af1..54d5bcd 100644
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
