From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 1 Mar 2014 16:41:12 +0100
Subject: [Buildroot] [PATCH v5 3/3] libdrm: bump to version 2.4.52
In-Reply-To: <1393688472-12141-1-git-send-email-berndkuhls@hotmail.com>
References: <1393688472-12141-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP39338347BA87475110C6A9FD98D0@phx.gbl>
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
index bc1aa89..881ff03 100644
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
1.7.10.4
