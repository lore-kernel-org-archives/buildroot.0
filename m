From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Apr 2019 09:06:39 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/gst1-plugins-base: drop legacy remnant comment
Message-ID: <20190429070420.2510C7FE6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fbfbb58706978f5c290ab0ab05cd109ed84d5e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

In 76722342000d (gst1-plugins-base: bump version to 1.12.0), the unknown
options were removed, but the comment associated to --disable-gio_unix_2_0
was left out.

Drop it now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 80a5217476c45e765db45acd8782f7f854783f93)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
