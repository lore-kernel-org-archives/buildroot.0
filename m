From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 20 Feb 2021 00:02:56 +0100
Subject: [Buildroot] [PATCH/next v1 5/5] package/imagemagick: disable
 remaining config options (heic, jxl, openjp2)
In-Reply-To: <20210219230256.27955-1-ps.report@gmx.net>
References: <20210219230256.27955-1-ps.report@gmx.net>
Message-ID: <20210219230256.27955-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.30.0
