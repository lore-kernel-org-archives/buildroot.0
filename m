From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 16:53:17 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/opencv3: fix typo
 in OPENCV_WARNINGS_ARE_ERRORS
Message-ID: <20201029154648.A6CFF86439@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f22dd1f9f7f6f1be77fa528565eb88ca80df4f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

OPENCV3_WARNINGS_ARE_ERRORS option does not exist so rename it to
OPENCV_WARNINGS_ARE_ERRORS (even if it is already disabled by default)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit caeb69cbf7b365b76350870cf69c5f17ae0fff72)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 70b0a4039f..f36966ebac 100644
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
