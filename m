From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2020 21:44:58 +0200
Subject: [Buildroot] [git commit] package/opencv3: fix typo in
 OPENCV_WARNINGS_ARE_ERRORS
Message-ID: <20201018193349.78E5484067@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caeb69cbf7b365b76350870cf69c5f17ae0fff72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OPENCV3_WARNINGS_ARE_ERRORS option does not exist so rename it to
OPENCV_WARNINGS_ARE_ERRORS (even if it is already disabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opencv3/opencv3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 12d2e3c00c..8cd28cbf0c 100644
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
