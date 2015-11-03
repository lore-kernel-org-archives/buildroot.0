From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Nov 2015 08:43:01 +0200
Subject: [Buildroot] [PATCH] imagemagick: use download location as hash
	source
Message-ID: <f1f4c7da1fc1a5d9792f673b287b34571e5b121e.1446532981.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 12a6c5b12cd1 (imagemagick: use official download site,
2015-02-17) we use the official ImageMagic size. Use it also as hash source.
That's the conversion we use in all other packages when upstream provides
hashes.

Cc: Fabio Porcedda <Fabio.Porcedda@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/imagemagick/imagemagick.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 0622ce21868a..61f73fb8faad 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
-# From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
+# From http://www.imagemagick.org/download/releases/digest.rdf
 sha256 19fb341725a13c01458cfce23d0a260fd032432a5daeebdd4f06c92d716ded40 ImageMagick-6.9.2-5.tar.xz
-- 
2.6.1
