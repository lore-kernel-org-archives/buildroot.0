From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 14 Oct 2014 21:46:19 +0200
Subject: [Buildroot] [PATCH] libqmi: bump to 1.10.4
Message-ID: <1413315979-6280-1-git-send-email-yegorslists@googlemail.com>
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
index ed71972..b083aea 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.10.2
+LIBQMI_VERSION = 1.10.4
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
1.8.3.2
