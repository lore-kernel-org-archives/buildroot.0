From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 18 Nov 2015 09:39:07 -0300
Subject: [Buildroot] [PATCH 1/6] gstreamer: add legal info
Message-ID: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Even though COPYING is LGPLv2+ some code files state v2.1+

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/gstreamer/gstreamer/gstreamer.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 1dbd66f..156afab 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -8,6 +8,8 @@ GSTREAMER_VERSION = 0.10.36
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
+GSTREAMER_LICENSE = LGPLv2+ LGPLv2.1+
+GSTREAMER_LICENSE_FILES = COPYING
 
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
-- 
2.4.10
