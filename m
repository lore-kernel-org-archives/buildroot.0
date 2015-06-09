From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:45:12 +0200
Subject: [Buildroot] [git commit] package/opencv: cleanup spaces at ends of
	line
Message-ID: <20150609204518.50F0781D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b79aee3e65792f5c5edef1492e9662c17f0c014a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nothing more than removing white spaces before '\' characters.
Of course, 'git diff -w' shows no change at all.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |  112 +++++++++++++++++++++++-----------------------
 1 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index ee84312..9967abc 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -18,51 +18,51 @@ OPENCV_CONF_OPTS += \
 
 # OpenCV build options
 OPENCV_CONF_OPTS += \
-	-DBUILD_WITH_STATIC_CRT=OFF      \
-	-DENABLE_FAST_MATH=ON            \
-	-DENABLE_NOISY_WARNINGS=OFF      \
-	-DENABLE_OMIT_FRAME_POINTER=ON   \
+	-DBUILD_WITH_STATIC_CRT=OFF \
+	-DENABLE_FAST_MATH=ON \
+	-DENABLE_NOISY_WARNINGS=OFF \
+	-DENABLE_OMIT_FRAME_POINTER=ON \
 	-DENABLE_PRECOMPILED_HEADERS=OFF \
-	-DENABLE_PROFILING=OFF           \
+	-DENABLE_PROFILING=OFF \
 	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
 
 # OpenCV link options
 OPENCV_CONF_OPTS += \
 	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
-	-DCMAKE_SKIP_RPATH=OFF                  \
+	-DCMAKE_SKIP_RPATH=OFF \
 	-DCMAKE_USE_RELATIVE_PATHS=OFF
 
 # OpenCV packaging options:
 OPENCV_CONF_OPTS += \
-	-DBUILD_PACKAGE=OFF           \
+	-DBUILD_PACKAGE=OFF \
 	-DENABLE_SOLUTION_FOLDERS=OFF \
 	-DINSTALL_CREATE_DISTRIB=OFF
 
 # OpenCV module selection
 OPENCV_CONF_OPTS += \
-	-DBUILD_opencv_androidcamera=OFF                                        \
-	-DBUILD_opencv_apps=OFF                                                 \
-	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
-	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF)   \
-	-DBUILD_opencv_core=ON                                                  \
-	-DBUILD_opencv_dynamicuda=OFF                                           \
+	-DBUILD_opencv_androidcamera=OFF \
+	-DBUILD_opencv_apps=OFF \
+	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF) \
+	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF) \
+	-DBUILD_opencv_core=ON \
+	-DBUILD_opencv_dynamicuda=OFF \
 	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
-	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF)       \
-	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF)           \
-	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF)   \
-	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF)   \
-	-DBUILD_opencv_java=OFF                                                 \
-	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF)     \
-	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF)             \
-	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF)   \
+	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF) \
+	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF) \
+	-DBUILD_opencv_highgui=$(if $(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),ON,OFF) \
+	-DBUILD_opencv_imgproc=$(if $(BR2_PACKAGE_OPENCV_LIB_IMGPROC),ON,OFF) \
+	-DBUILD_opencv_java=OFF \
+	-DBUILD_opencv_legacy=$(if $(BR2_PACKAGE_OPENCV_LIB_LEGACY),ON,OFF) \
+	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF) \
+	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF) \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
-	-DBUILD_opencv_ocl=OFF                                                  \
-	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
-	-DBUILD_opencv_python=OFF                                               \
+	-DBUILD_opencv_ocl=OFF \
+	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF) \
+	-DBUILD_opencv_python=OFF \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
 	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
-	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
-	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF)       \
+	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF) \
+	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF) \
 	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
 	-DBUILD_opencv_world=OFF
 
@@ -72,10 +72,10 @@ OPENCV_CONF_OPTS += \
 #   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
 OPENCV_CONF_OPTS += \
 	-DENABLE_POWERPC=OFF \
-	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF)     \
-	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)   \
-	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)   \
-	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF)  \
+	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) \
+	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
+	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
+	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
 	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
 	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
 	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
@@ -84,7 +84,7 @@ OPENCV_CONF_OPTS += \
 # Cuda stuff
 OPENCV_CONF_OPTS += \
 	-DWITH_CUBLAS=OFF \
-	-DWITH_CUDA=OFF   \
+	-DWITH_CUDA=OFF \
 	-DWITH_CUFFT=OFF
 
 # NVidia stuff
@@ -98,7 +98,7 @@ OPENCV_CONF_OPTS += \
 # Intel stuff
 OPENCV_CONF_OPTS += \
 	-DWITH_INTELPERC=OFF \
-	-DWITH_IPP=OFF       \
+	-DWITH_IPP=OFF \
 	-DWITH_TBB=OFF
 
 # Smartek stuff
@@ -112,53 +112,53 @@ OPENCV_CONF_OPTS += -DWITH_XIMEA=OFF
 
 # Non-Linux support (Android options) must remain OFF:
 OPENCV_CONF_OPTS += \
-	-DWITH_ANDROID_CAMERA=OFF          \
+	-DWITH_ANDROID_CAMERA=OFF \
 	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
-	-DBUILD_ANDROID_EXAMPLES=OFF	   \
-	-DINSTALL_ANDROID_EXAMPLES=OFF     \
-	-DBUILD_FAT_JAVA_LIB=OFF           \
+	-DBUILD_ANDROID_EXAMPLES=OFF \
+	-DINSTALL_ANDROID_EXAMPLES=OFF \
+	-DBUILD_FAT_JAVA_LIB=OFF \
 	-DBUILD_JAVA_SUPPORT=OFF
 
 # Non-Linux support (Mac OSX options) must remain OFF:
 OPENCV_CONF_OPTS += \
-	-DWITH_AVFOUNDATION=OFF	\
-	-DWITH_CARBON=OFF       \
+	-DWITH_AVFOUNDATION=OFF \
+	-DWITH_CARBON=OFF \
 	-DWITH_QUICKTIME=OFF
 
 # Non-Linux support (Windows options) must remain OFF:
 OPENCV_CONF_OPTS += \
-	-DWITH_VFW=OFF      \
-	-DWITH_WIN32UI=OFF  \
+	-DWITH_VFW=OFF \
+	-DWITH_WIN32UI=OFF \
 	-DWITH_CSTRIPES=OFF \
-	-DWITH_DSHOW=OFF    \
-	-DWITH_MSMF=OFF     \
+	-DWITH_DSHOW=OFF \
+	-DWITH_MSMF=OFF \
 	-DWITH_VIDEOINPUT=OFF
 
 # Software/3rd-party support options.
 OPENCV_CONF_OPTS += \
-	-DBUILD_JASPER=OFF  \
-	-DBUILD_JPEG=OFF    \
+	-DBUILD_JASPER=OFF \
+	-DBUILD_JPEG=OFF \
 	-DBUILD_OPENEXR=OFF \
-	-DBUILD_PNG=OFF	    \
-	-DBUILD_TIFF=OFF    \
-	-DBUILD_ZLIB=OFF    \
+	-DBUILD_PNG=OFF \
+	-DBUILD_TIFF=OFF \
+	-DBUILD_ZLIB=OFF \
 	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
-	-DINSTALL_C_EXAMPLES=OFF       \
-	-DINSTALL_PYTHON_EXAMPLES=OFF  \
+	-DINSTALL_C_EXAMPLES=OFF \
+	-DINSTALL_PYTHON_EXAMPLES=OFF \
 	-DINSTALL_TO_MANGLED_PATHS=OFF
 
 # Disabled features (mostly because they are not available in Buildroot), but
 # - eigen: OpenCV does not use it, not take any benefit from it.
 OPENCV_CONF_OPTS += \
-	-DWITH_1394=OFF    \
-	-DWITH_EIGEN=OFF   \
+	-DWITH_1394=OFF \
+	-DWITH_EIGEN=OFF \
 	-DWITH_IMAGEIO=OFF \
-	-DWITH_OPENCL=OFF  \
+	-DWITH_OPENCL=OFF \
 	-DWITH_OPENEXR=OFF \
-	-DWITH_OPENGL=OFF  \
-	-DWITH_OPENMP=OFF  \
-	-DWITH_OPENNI=OFF  \
-	-DWITH_UNICAP=OFF  \
+	-DWITH_OPENGL=OFF \
+	-DWITH_OPENMP=OFF \
+	-DWITH_OPENNI=OFF \
+	-DWITH_UNICAP=OFF \
 	-DWITH_XINE=OFF
 
 OPENCV_DEPENDENCIES += zlib
