From: Ozgun <ozgun.gunay@gmail.com>
Date: Wed, 15 Feb 2012 17:35:08 +0200
Subject: [Buildroot] opencv with glibc
Message-ID: <CAPeX=+tCiegGOeD2bi9+v8aOVrB=FjHo3XEAvp1b5tNfR85N-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using ct-ng toolchain and glibc library. when compiling opencv gives
the following uclibc error;



>>> opencv 2.3.1a Patching package//opencv
>>> opencv 2.3.1a Configuring
(cd /usr/src/br/buildroot/output/build/opencv-2.3.1a/ && rm -f
CMakeCache.txt &&  /usr/src/br/buildroot/output/host/usr/bin/cmake
/usr/src/br/buildroot/output/build/opencv-2.3.1a/
-DCMAKE_TOOLCHAIN_FILE="/usr/src/br/buildroot/output/toolchainfile.cmake"
-DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DBUILD_DOCS=OFF
-DBUILD_EXAMPLES=OFF -DBUILD_PACKAGE=OFF -DBUILD_TESTS=OFF
-DBUILD_SHARED_LIBS=ON -DINSTALL_C_EXAMPLES=OFF
-DINSTALL_PYTHON_EXAMPLES=OFF -DOPENCV_BUILD_3RDPARTY_LIBS=OFF
-DENABLE_PROFILING=OFF -DCMAKE_SKIP_RPATH=OFF -DUSE_FAST_MATH=ON
-DUSE_OMIT_FRAME_POINTER=ON -DUSE_PRECOMPILED_HEADERS=OFF -DWITH_1394=OFF
-DWITH_CUDA=OFF -DWITH_EIGEN=OFF -DWITH_IPP=OFF -DWITH_JASPER=OFF
-DWITH_OPENEXR=OFF -DWITH_OPENNI=OFF -DWITH_PVAPI=OFF -DWITH_TBB=OFF
-DWITH_UNICAP=OFF -DWITH_XINE=OFF -DBUILD_NEW_PYTHON_SUPPORT=OFF
-DWITH_FFMPEG=OFF -DWITH_GSTREAMER=OFF -DWITH_GTK=OFF -DWITH_JPEG=OFF
-DWITH_PNG=OFF -DWITH_QT=ON -DWITH_QT_OPENGL=OFF -DWITH_TIFF=OFF
-DWITH_V4L=ON )
Re-run cmake no build system arguments
-- The C compiler identification is unknown
-- The CXX compiler identification is unknown
-- Check for working C compiler:
/usr/src/br/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-gcc
CMake Error: your C compiler:
"/usr/src/br/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-gcc"
was not found.   Please set CMAKE_C_COMPILER to a valid compiler path or
name.
CMake Error: Internal CMake error, TryCompile configure of cmake failed
-- Check for working C compiler:
/usr/src/br/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-gcc --
broken
CMake Error at
/usr/src/br/buildroot/output/host/usr/share/cmake-2.8/Modules/CMakeTestCCompiler.cmake:52
(MESSAGE):
  The C compiler
  "/usr/src/br/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-gcc"
  is not able to compile a simple test program.

  It fails with the following output:





  CMake will not be able to correctly generate this project.
Call Stack (most recent call first):
  CMakeLists.txt:40 (project)


CMake Error: your C compiler:
"/usr/src/br/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-gcc"
was not found.   Please set CMAKE_C_COMPILER to a valid compiler path or
name.
CMake Error: your CXX compiler:
"/usr/src/br/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-g++"
was not found.   Please set CMAKE_CXX_COMPILER to a valid compiler path or
name.
-- Configuring incomplete, errors occurred!
make: ***
[/usr/src/br/buildroot/output/build/opencv-2.3.1a/.stamp_configured] Error 1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120215/ed828bd0/attachment.html>
