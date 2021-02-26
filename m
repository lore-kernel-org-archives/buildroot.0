From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 00:39:17 +0100
Subject: [Buildroot] [git commit] package/imagemagick: disable remaining
 config options (heic, jxl, openjp2)
Message-ID: <20210226231840.DD3477F901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42c80b515a9c3d2e9674cb8947c172a893df5896
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 30200e95b0..97517228cf 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -32,9 +32,12 @@ IMAGEMAGICK_CONF_OPTS = \
 	--without-fpx \
 	--without-gslib \
 	--without-gvc \
+	--without-heic \
 	--without-jbig \
+	--without-jxl \
 	--without-lqr \
 	--without-openexr \
+	--without-openjp2 \
 	--without-perl \
 	--without-raqm \
 	--without-wmf \
@@ -184,9 +187,12 @@ HOST_IMAGEMAGICK_CONF_OPTS = \
 	--without-fpx \
 	--without-gslib \
 	--without-gvc \
+	--without-heic \
 	--without-jbig \
+	--without-jxl \
 	--without-lqr \
 	--without-openexr \
+	--without-openjp2 \
 	--without-perl \
 	--without-raqm \
 	--without-raw \
