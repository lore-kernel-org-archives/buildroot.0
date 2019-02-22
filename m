From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 13:29:51 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/imagemagick:
 fixup help text layout
Message-ID: <20190222122948.1DF168D5A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1520bdf65ddb4cd96614b808b44b5dca518dbd9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 858d2e9a27444b6321821a1fd1856564e68d31cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/Config.in b/package/imagemagick/Config.in
index 4bd81dbd79..8b795d89e5 100644
--- a/package/imagemagick/Config.in
+++ b/package/imagemagick/Config.in
@@ -9,8 +9,8 @@ config BR2_PACKAGE_IMAGEMAGICK
 	  JPEG, JPEG-2000, PDF, PhotoCD, PNG, Postscript, SVG, and TIFF.
 	  Use ImageMagick to translate, flip, mirror, rotate, scale,
 	  shear and transform images, adjust image colors, apply various
-	  special effects, or draw text,
-	  lines, polygons, ellipses and B??zier curves.
+	  special effects, or draw text, lines, polygons, ellipses and
+	  B??zier curves.
 
 	  http://www.imagemagick.org/
 
