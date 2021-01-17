From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 10:00:09 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: add FFMPEG_CPE_ID_VENDOR
Message-ID: <20210117084212.D5F3586F55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a961655ede9dc5dc36eed760c227a6b80257b63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:ffmpeg:ffmpeg is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Affmpeg%3Affmpeg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
