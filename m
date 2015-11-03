From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:44:35 +0100
Subject: [Buildroot] [git commit] imagemagick: use download location as hash
	source
Message-ID: <20151103145129.9D22C81E71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a555062109fa21d945511f606680386e2f2199a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 12a6c5b12cd1 (imagemagick: use official download site,
2015-02-17) we use the official ImageMagic size. Use it also as hash source.
That's the conversion we use in all other packages when upstream provides
hashes.

Cc: Fabio Porcedda <Fabio.Porcedda@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 0622ce2..61f73fb 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
-# From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
+# From http://www.imagemagick.org/download/releases/digest.rdf
 sha256 19fb341725a13c01458cfce23d0a260fd032432a5daeebdd4f06c92d716ded40 ImageMagick-6.9.2-5.tar.xz
