From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:40:57 +0100
Subject: [Buildroot] [git commit] package/live555: add CPE variables
Message-ID: <20210303122740.8C02486DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88053c3bae860499f50f021e978a588a563947b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:live555:streaming_media is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alive555%3Astreaming_media

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
