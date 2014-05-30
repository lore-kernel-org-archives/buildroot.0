From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Date: Fri, 30 May 2014 17:00:22 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set parent
	include dir
Message-ID: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
---
 package/ti-gfx/glesv2.pc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-gfx/glesv2.pc b/package/ti-gfx/glesv2.pc
index 4c70aec..c3846d0 100644
--- a/package/ti-gfx/glesv2.pc
+++ b/package/ti-gfx/glesv2.pc
@@ -8,4 +8,4 @@ Description: TI Graphics SDK implementation of OpenGL ESv2
 Version: 1.9.2188537
 Requires:
 Libs: -L${libdir} -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
-Cflags: -I${includedir}/GLES2
+Cflags: -I${includedir}/GLES2 -I${includedir}
-- 
1.9.1
