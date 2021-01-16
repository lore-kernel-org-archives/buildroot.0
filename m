From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 00:09:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: add FFMPEG_CPE_ID_VENDOR
Message-ID: <20210116230932.212050-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:ffmpeg:ffmpeg is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Affmpeg%3Affmpeg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ffmpeg/ffmpeg.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index fd4a8ab1c4..6d28bfbed7 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -16,6 +16,8 @@ FFMPEG_LICENSE += and GPL-2.0+
 FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
+FFMPEG_CPE_ID_VENDOR = ffmpeg
+
 FFMPEG_CONF_OPTS = \
 	--prefix=/usr \
 	--enable-avfilter \
-- 
2.29.2
