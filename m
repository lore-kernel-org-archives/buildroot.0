From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 31 Jul 2014 00:05:33 +0200
Subject: [Buildroot] [PATCH 2/2] libqmi: bump to 1.10.2
In-Reply-To: <1406757933-4362-1-git-send-email-yegorslists@googlemail.com>
References: <1406757933-4362-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1406757933-4362-2-git-send-email-yegorslists@googlemail.com>
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
index f63fd49..69981ba 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.10.0
+LIBQMI_VERSION = 1.10.2
 LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi/
 LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
1.8.3.2
