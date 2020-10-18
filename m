From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Oct 2020 15:47:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix typo in
 OPENCV_WARNINGS_ARE_ERRORS
Message-ID: <20201018134732.960533-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OPENCV3_WARNINGS_ARE_ERRORS option does not exist so rename it to
OPENCV_WARNINGS_ARE_ERRORS (even if it is already disabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/opencv3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 648cc66af3..c67387e114 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -53,7 +53,7 @@ OPENCV3_CONF_OPTS += \
 	-DENABLE_OMIT_FRAME_POINTER=ON \
 	-DENABLE_PRECOMPILED_HEADERS=OFF \
 	-DENABLE_PROFILING=OFF \
-	-DOPENCV3_WARNINGS_ARE_ERRORS=OFF
+	-DOPENCV_WARNINGS_ARE_ERRORS=OFF
 
 # OpenCV link options
 OPENCV3_CONF_OPTS += \
-- 
2.28.0
