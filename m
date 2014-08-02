From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Aug 2014 11:18:32 +0200
Subject: [Buildroot] [PATCH 2/2] libxcb: Bump version to 1.11
In-Reply-To: <1406971112-28226-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406971112-28226-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1406971112-28226-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/libxcb/libxcb.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index e955248..a8395bb 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.10
+LIBXCB_VERSION = 1.11
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
-- 
1.7.10.4
