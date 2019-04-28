From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Apr 2019 13:10:34 +0200
Subject: [Buildroot] [PATCH] package/gst1-plugins-base: drop legacy remnant
 comment
Message-ID: <20190428111034.5261-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 76722342000d (gst1-plugins-base: bump version to 1.12.0), the unknown
options were removed, but the comment associated to --disable-gio_unix_2_0
was left out.

Drop it now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index fb976f9a94..5b7db0814f 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -11,7 +11,6 @@ GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
 GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+
 
-# gio_unix_2_0 is only used for tests
 GST1_PLUGINS_BASE_CONF_OPTS = \
 	--disable-examples \
 	--disable-valgrind \
-- 
2.14.1
