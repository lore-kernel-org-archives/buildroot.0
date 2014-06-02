From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  2 Jun 2014 11:39:12 +0200
Subject: [Buildroot] [PATCH] libqmi: bump to 1.10.0
Message-ID: <1401701952-8758-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libqmi/libqmi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index f258af1..f63fd49 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.8.0
+LIBQMI_VERSION = 1.10.0
 LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi/
 LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
1.8.1.2
