From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jan 2021 22:08:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add CPE variables
Message-ID: <20210126210845.2497502-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:wpewebkit:wpe_webkit is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awpewebkit%3Awpe_webkit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wpewebkit/wpewebkit.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index d3afdf0094..91f137d96f 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -12,6 +12,8 @@ WPEWEBKIT_LICENSE = LGPL-2.1+, BSD-2-Clause
 WPEWEBKIT_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
+WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
+WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
-- 
2.29.2
