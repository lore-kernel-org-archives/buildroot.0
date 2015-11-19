From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 19 Nov 2015 19:14:17 -0300
Subject: [Buildroot] [PATCH v2 1/5] gstreamer: add legal info
Message-ID: <1447971261-26290-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Even though COPYING is LGPLv2+ many code files state v2.1+

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer/gstreamer/gstreamer.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 1dbd66f..cd3cf2d 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -8,6 +8,9 @@ GSTREAMER_VERSION = 0.10.36
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
+# COPYING is in fact v2, but most of the code is v2.1+
+GSTREAMER_LICENSE = LGPLv2.1+
+GSTREAMER_LICENSE_FILES = COPYING
 
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
-- 
2.4.10
