From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Dec 2017 17:16:27 +0200
Subject: [Buildroot] [PATCH] libsoxr: remove unicode dash from help text
Message-ID: <aba1f1782c8833a67af16f2325a5fccf6cc2e689.1513782978.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This would make the unicode challenged menuconfig show something
sensible.

Split the sentence for the text to make sense.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libsoxr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoxr/Config.in b/package/libsoxr/Config.in
index a218ae99c89c..ae1ea1028030 100644
--- a/package/libsoxr/Config.in
+++ b/package/libsoxr/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBSOXR
 	bool "libsoxr"
 	help
 	  The SoX Resampler library `libsoxr' performs one-dimensional
-	  sample-rate conversion?it may be used, for example, to
+	  sample-rate conversion. It may be used, for example, to
 	  resample PCM-encoded audio.
 
 	  It aims to give fast and high quality results for any constant
-- 
2.15.1
