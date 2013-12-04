From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  4 Dec 2013 10:55:02 +0100
Subject: [Buildroot] [PATCH v6 1/3] libqmi: bump to 1.6.0
Message-ID: <1386150904-16813-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libqmi/libqmi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
1.7.7
