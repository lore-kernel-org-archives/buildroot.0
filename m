From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:25:47 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/gstreamer1/gst1-plugins-bad: add CPE variables
Message-ID: <20210517210058.7DC76875F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15116e42cbc61a93f8b6c8f5441c2161efa43dcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:freedesktop:gst-plugins-bad is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreedesktop%3Agst-plugins-bad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 13c22420340d7e31f48ca955882ec2edc731961c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index f1be9cd961..f4cf0d534f 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -12,6 +12,8 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 # GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING
 GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+
+GST1_PLUGINS_BAD_CPE_ID_VENDOR = freedesktop
+GST1_PLUGINS_BAD_CPE_ID_PRODUCT = gst-plugins-bad
 
 GST1_PLUGINS_BAD_CFLAGS = $(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE
 GST1_PLUGINS_BAD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
