From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 10:24:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/live555: add CPE variables
Message-ID: <20210303092428.468359-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:live555:streaming_media is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alive555%3Astreaming_media

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/live555/live555.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 6218126954..9a5c1c7c0d 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -13,6 +13,8 @@ LIVE555_SITE = http://www.live555.com/liveMedia/public
 # http://live555.com/liveMedia/faq.html#copyright-and-license
 LIVE555_LICENSE = LGPL-3.0+
 LIVE555_LICENSE_FILES = COPYING.LESSER
+LIVE555_CPE_ID_VENDOR = live555
+LIVE555_CPE_ID_PRODUCT = streaming_media
 LIVE555_INSTALL_STAGING = YES
 
 LIVE555_CFLAGS = $(TARGET_CFLAGS)
-- 
2.30.0
