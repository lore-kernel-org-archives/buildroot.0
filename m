From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 31 Jul 2012 09:16:12 +0100
Subject: [Buildroot] [PATCH] lcdproc: add license information
Message-ID: <1343722572-10070-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/lcdproc/lcdproc.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 1275ddf..da2909d 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -6,6 +6,8 @@
 LCDPROC_VERSION = 0.5.5
 LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
 LCDPROC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
+LCDPROC_LICENSE = LGPLv2+
+LCDPROC_LICENSE_FILES = COPYING
 
 LCDPROC_CONF_OPT = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS)
 
-- 
1.7.9.5
