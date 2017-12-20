From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 17:46:36 +0100
Subject: [Buildroot] [git commit] libsoxr: remove unicode dash from help text
Message-ID: <20171220164656.A08A883585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5099c909393e6dc0c4e16f904e36259b4e499cb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This would make the unicode challenged menuconfig show something
sensible.

Split the sentence for the text to make sense.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoxr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoxr/Config.in b/package/libsoxr/Config.in
index a218ae9..ae1ea10 100644
--- a/package/libsoxr/Config.in
+++ b/package/libsoxr/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBSOXR
 	bool "libsoxr"
 	help
 	  The SoX Resampler library `libsoxr' performs one-dimensional
-	  sample-rate conversion???it may be used, for example, to
+	  sample-rate conversion. It may be used, for example, to
 	  resample PCM-encoded audio.
 
 	  It aims to give fast and high quality results for any constant
