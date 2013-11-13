From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 13 Nov 2013 21:57:38 +0100
Subject: [Buildroot] [PATCH v5 1/4] libqmi: bump to 1.6.0
Message-ID: <1384376261-29291-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libqmi/libqmi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 4f3f9a9..edd11f7 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.4.0
+LIBQMI_VERSION = 1.6.0
 LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi/
 LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
1.8.1.2
