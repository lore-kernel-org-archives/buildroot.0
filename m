From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 01 Aug 2016 01:06:59 +0000
Subject: [Buildroot] [Bug 9121] New: gst1-imx for i.MX6 compile failed,
 cannot find PXP, IPU and other errors
Message-ID: <bug-9121-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9121

            Bug ID: 9121
           Summary: gst1-imx for i.MX6 compile failed, cannot find PXP,
                    IPU and other errors
           Product: buildroot
           Version: 2016.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: rdghx at 163.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

gst1-imx-0.12.1.tar.gz: OK (sha256:
d8a7357bc575e22d0d19d6d7cf547bd69cad5fc47adb93f09ead41b0124353fa)
>>> gst1-imx 0.12.1 Extracting
gzip -d -c /home/ganhx/work/buildroot/dl/gst1-imx-0.12.1.tar.gz | tar
--strip-components=1 -C
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1   -xf
-
>>> gst1-imx 0.12.1 Patching
>>> gst1-imx 0.12.1 Configuring
cd /home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1;
PATH="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/bin:/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/sbin:/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin:/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/sbin:/home/ganhx/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/jdk1.6.0_45/bin:/opt/codesourcery/bin:/android-ndk-r7b:/opt/gcc-linaro/bin"
AR="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-ar"
AS="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-as"
LD="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-ld"
NM="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-nm"
CC="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-gcc"
GCC="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-gcc"
CPP="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-cpp"
CXX="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-g++"
FC="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-gfortran"
F77="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-gfortran"
RANLIB="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-ranlib"
READELF="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-readelf"
STRIP="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-strip"
OBJCOPY="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-objcopy"
OBJDUMP="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/ccache
/usr/bin/gcc"
GCC_FOR_BUILD="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/ccache
/usr/bin/gcc"
CXX_FOR_BUILD="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/ccache
/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/include"
CFLAGS_FOR_BUILD="-O2
-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/lib
-L/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/lib
-Wl,-rpath,/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-as"
DEFAULT_LINKER="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
" LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os "
PKG_CONFIG="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/pkg-config"
STAGING_DIR="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/arm-buildroot-linux-gnueabihf/sysroot"
INTLTOOL_PERL=/usr/bin/perl
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/python2 ./waf
configure --prefix="/usr"
--kernel-headers="/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/linux-rel_imx_3.14.52_1.1.0_ga/include"
--egl-platform=wayland
Setting top to                           :
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1 
Setting out to                           :
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1/build 
Checking for 'gcc' (c compiler)          :
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-gcc 
Need to test compiler flags -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os 
Checking if building with these flags works : yes 
Checking for compiler switch -O2            : yes 
Checking for compiler switch -DPIC          : yes 
Checking for compiler switch -fPIC          : yes 
Checking for compiler switch -std=gnu99     : yes 
Checking for compiler switch -Wall          : yes 
Checking for compiler switch -Wextra        : yes 
Checking for compiler switch -Wno-sign-compare : yes 
Checking for compiler switch -Wno-missing-field-initializers : yes 
Checking for compiler switch -Wno-unused-parameter           : yes 
Checking for compiler switch -Wno-cpp                        : yes 
Checking for program objdump                                 :
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-objdump 
Building for Android                                         : no 
Checking for library dl                                      : yes 
Checking for library m                                       : yes 
Checking for library pthread                                 : yes 
Checking for program pkg-config                              :
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/pkg-config 
Checking for 'gstreamer-1.0' version                         : yes 
Checking for 'gstreamer-1.0 >= 1.2.0'                        : yes 
Checking for 'gstreamer-base-1.0 >= 1.2.0'                   : yes 
Checking for 'gstreamer-audio-1.0 >= 1.2.0'                  : yes 
Checking for 'gstreamer-video-1.0 >= 1.2.0'                  : yes 
Checking for library gstphotography-1.0                      : yes 
checking whether or not the kernel version is greater than 3.5.0 : no 
Checking for library g2d                                         : yes 
Checking for header g2d.h                                        : yes 
G2D elements will be built 
checking for linux/pxp_device.h                                  : no 
PxP elements will not be built - headers not found 
checking for linux/fb.h and the IPU header linux/ipu.h           : no 
IPU elements will not be built - headers not found 
Checking for 'libimxvpuapi'                                      : not found 
could not find installed imxvpuapi library - VPU elements will not be built 
Checking for 'wayland-client'                                    : yes 
Checking for 'wayland-cursor'                                    : yes 
Checking for 'wayland-egl'                                       : yes 
Checking for library ['EGL']                                     : yes 
Checking for header EGL/egl.h                                    : yes 
Checking for library GLESv2                                      : yes 
Checking for header GLES2/gl2.h                                  : yes 
Checking for header ['GLES2/gl2.h', 'GLES2/gl2ext.h']            : yes 
EGL sink with Vivante direct textures will be built 
Selected EGL platform: wayland 
Checking for 'libfslaudiocodec'                                  : yes 
Searching fslcodec plugin directory                              : found 
  added AAC LC decoder (soname: lib_aacd_wrap_arm12_elinux.so.3) 
  added MP3 decoder (soname: lib_mp3d_wrap_arm12_elinux.so.3) 
  added Vorbis decoder (soname: lib_vorbisd_wrap_arm12_elinux.so.3) 
  added narrowband AMR decoder (soname: lib_nbamrd_wrap_arm11_elinux.so.1) 
  added wideband AMR decoder (soname: lib_wbamrd_wrap_arm12_elinux.so.1) 
  could not add WMA decoder 
uniaudio decoder will be built 
Checking for library _mp3_enc_arm12_elinux                       : not found 
mp3 encoder will not be built 
'configure' finished successfully (14.521s)
>>> gst1-imx 0.12.1 Building
cd /home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1;
/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/python2 ./waf
build -j 2
Waf: Entering directory
`/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1/build'
[ 1/40] c: src/common/canvas.c -> build/src/common/canvas.c.1.o
[ 2/40] c: src/common/fd_object.c -> build/src/common/fd_object.c.1.o
[ 3/40] c: src/common/phys_mem_allocator.c ->
build/src/common/phys_mem_allocator.c.1.o
[ 4/40] c: src/common/phys_mem_buffer_pool.c ->
build/src/common/phys_mem_buffer_pool.c.1.o
[ 5/40] c: src/common/phys_mem_meta.c -> build/src/common/phys_mem_meta.c.1.o
[ 6/40] c: src/common/region.c -> build/src/common/region.c.1.o
[ 7/40] c: src/g2d/allocator.c -> build/src/g2d/allocator.c.1.o
[ 8/40] c: src/g2d/blitter.c -> build/src/g2d/blitter.c.1.o
[ 9/40] c: src/g2d/compositor.c -> build/src/g2d/compositor.c.1.o
[10/40] c: src/g2d/plugin.c -> build/src/g2d/plugin.c.1.o
[11/40] c: src/g2d/video_sink.c -> build/src/g2d/video_sink.c.1.o
[12/40] c: src/g2d/video_transform.c -> build/src/g2d/video_transform.c.1.o
[13/40] c: src/eglvivsink/eglvivsink.c -> build/src/eglvivsink/eglvivsink.c.1.o
[14/40] c: src/eglvivsink/gl_headers.c -> build/src/eglvivsink/gl_headers.c.1.o
[15/40] c: src/eglvivsink/gles2_renderer.c ->
build/src/eglvivsink/gles2_renderer.c.1.o
[16/40] c: src/eglvivsink/egl_misc.c -> build/src/eglvivsink/egl_misc.c.1.o
[17/40] c: src/eglvivsink/plugin.c -> build/src/eglvivsink/plugin.c.1.o
[18/40] c: src/eglvivsink/egl_platform_wayland.c ->
build/src/eglvivsink/egl_platform_wayland.c.1.o
[19/40] c: src/v4l2src/v4l2_buffer_pool.c ->
build/src/v4l2src/v4l2_buffer_pool.c.1.o
[20/40] c: src/v4l2src/v4l2src.c -> build/src/v4l2src/v4l2src.c.1.o
In file included from ../src/v4l2src/v4l2src.c:24:0:
../../../host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/gstreamer-1.0/gst/interfaces/photography.h:28:2:
warning: #warning "The GstPhotography interface is unstable API and may change
in future." [-Wcpp]
 #warning "The GstPhotography interface is unstable API and may change in
future."
  ^
../../../host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/gstreamer-1.0/gst/interfaces/photography.h:29:2:
warning: #warning "You can define GST_USE_UNSTABLE_API to avoid this warning."
[-Wcpp]
 #warning "You can define GST_USE_UNSTABLE_API to avoid this warning." 
  ^
../src/v4l2src/v4l2src.c: In function ?ctrl_name?:
../src/v4l2src/v4l2src.c:942:8: error: ?V4L2_CID_AUTO_FOCUS_RANGE? undeclared
(first use in this function)
   case V4L2_CID_AUTO_FOCUS_RANGE:
        ^
../src/v4l2src/v4l2src.c:942:8: note: each undeclared identifier is reported
only once for each function it appears in
../src/v4l2src/v4l2src.c:944:8: error: ?V4L2_CID_AUTO_FOCUS_START? undeclared
(first use in this function)
   case V4L2_CID_AUTO_FOCUS_START:
        ^
../src/v4l2src/v4l2src.c:946:8: error: ?V4L2_CID_AUTO_FOCUS_STOP? undeclared
(first use in this function)
   case V4L2_CID_AUTO_FOCUS_STOP:
        ^
../src/v4l2src/v4l2src.c:948:8: error: ?V4L2_CID_AUTO_FOCUS_STATUS? undeclared
(first use in this function)
   case V4L2_CID_AUTO_FOCUS_STATUS:
        ^
../src/v4l2src/v4l2src.c:950:8: error: ?V4L2_CID_3A_LOCK? undeclared (first use
in this function)
   case V4L2_CID_3A_LOCK:
        ^
../src/v4l2src/v4l2src.c: In function ?gst_imx_v4l2src_apply_focus_settings?:
../src/v4l2src/v4l2src.c:1005:23: error: ?V4L2_CID_AUTO_FOCUS_STOP? undeclared
(first use in this function)
  v4l2_s_ctrl(v4l2src, V4L2_CID_AUTO_FOCUS_STOP, 0);
                       ^
../src/v4l2src/v4l2src.c:1013:27: error: ?V4L2_CID_3A_LOCK? undeclared (first
use in this function)
  if (v4l2_g_ctrl(v4l2src, V4L2_CID_3A_LOCK, &locks) == 0 && (locks &
V4L2_LOCK_FOCUS))
                           ^
../src/v4l2src/v4l2src.c:1013:70: error: ?V4L2_LOCK_FOCUS? undeclared (first
use in this function)
  if (v4l2_g_ctrl(v4l2src, V4L2_CID_3A_LOCK, &locks) == 0 && (locks &
V4L2_LOCK_FOCUS))
                                                                      ^
../src/v4l2src/v4l2src.c:1023:13: error: ?V4L2_AUTO_FOCUS_RANGE_AUTO?
undeclared (first use in this function)
     range = V4L2_AUTO_FOCUS_RANGE_AUTO;
             ^
../src/v4l2src/v4l2src.c:1026:13: error: ?V4L2_AUTO_FOCUS_RANGE_MACRO?
undeclared (first use in this function)
     range = V4L2_AUTO_FOCUS_RANGE_MACRO;
             ^
../src/v4l2src/v4l2src.c:1029:13: error: ?V4L2_AUTO_FOCUS_RANGE_INFINITY?
undeclared (first use in this function)
     range = V4L2_AUTO_FOCUS_RANGE_INFINITY;
             ^
../src/v4l2src/v4l2src.c:1032:13: error: ?V4L2_AUTO_FOCUS_RANGE_NORMAL?
undeclared (first use in this function)
     range = V4L2_AUTO_FOCUS_RANGE_NORMAL;
             ^
../src/v4l2src/v4l2src.c:1036:24: error: ?V4L2_CID_AUTO_FOCUS_RANGE? undeclared
(first use in this function)
   v4l2_s_ctrl(v4l2src, V4L2_CID_AUTO_FOCUS_RANGE, range);
                        ^
../src/v4l2src/v4l2src.c: In function ?gst_imx_v4l2src_af_check_status?:
../src/v4l2src/v4l2src.c:1106:27: error: ?V4L2_CID_AUTO_FOCUS_STATUS?
undeclared (first use in this function)
  if (v4l2_g_ctrl(v4l2src, V4L2_CID_AUTO_FOCUS_STATUS, &status) < 0)
                           ^
../src/v4l2src/v4l2src.c:1111:8: error: ?V4L2_AUTO_FOCUS_STATUS_IDLE?
undeclared (first use in this function)
   case V4L2_AUTO_FOCUS_STATUS_IDLE:
        ^
../src/v4l2src/v4l2src.c:1118:8: error: ?V4L2_AUTO_FOCUS_STATUS_BUSY?
undeclared (first use in this function)
   case V4L2_AUTO_FOCUS_STATUS_BUSY:
        ^
../src/v4l2src/v4l2src.c:1122:8: error: ?V4L2_AUTO_FOCUS_STATUS_REACHED?
undeclared (first use in this function)
   case V4L2_AUTO_FOCUS_STATUS_REACHED:
        ^
../src/v4l2src/v4l2src.c:1127:8: error: ?V4L2_AUTO_FOCUS_STATUS_FAILED?
undeclared (first use in this function)
   case V4L2_AUTO_FOCUS_STATUS_FAILED:
        ^
../src/v4l2src/v4l2src.c: In function ?gst_imx_v4l2src_set_autofocus?:
../src/v4l2src/v4l2src.c:1201:28: error: ?V4L2_CID_3A_LOCK? undeclared (first
use in this function)
   if (v4l2_g_ctrl(v4l2src, V4L2_CID_3A_LOCK, &locks) == 0)
                            ^
../src/v4l2src/v4l2src.c:1203:24: error: ?V4L2_LOCK_FOCUS? undeclared (first
use in this function)
    if (on && !(locks & V4L2_LOCK_FOCUS))
                        ^
../src/v4l2src/v4l2src.c:1213:29: error: ?V4L2_CID_AUTO_FOCUS_START? undeclared
(first use in this function)
    if (v4l2_s_ctrl(v4l2src, V4L2_CID_AUTO_FOCUS_START, 0) == 0)
                             ^
../src/v4l2src/v4l2src.c:1217:25: error: ?V4L2_CID_AUTO_FOCUS_STOP? undeclared
(first use in this function)
    v4l2_s_ctrl(v4l2src, V4L2_CID_AUTO_FOCUS_STOP, 0);
                         ^
Waf: Leaving directory
`/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1/build'
Build failed
 -> task in 'gstimxv4l2videosrc' failed (exit status 1): 
        {task 1087211724: c v4l2src.c -> v4l2src.c.1.o}
['/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/bin/arm-linux-gnueabihf-gcc',
'-Wextra', '-Wall', '-std=gnu99', '-fPIC', '-DPIC', '-O2',
'-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64',
'-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64',
'-Os', '-fPIC', '-pthread', '-pthread', '-pthread', '-pthread', '-pthread',
'-Wno-unused-parameter', '-Wno-missing-field-initializers',
'-Wno-sign-compare',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1/build/src/v4l2src',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1/src/v4l2src',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1/build',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/gstreamer-1.0',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/gstreamer-1.0/include',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/glib-2.0',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/glib-2.0/include',
'-I/home/ganhx/work/buildroot/qt5-buildroot/mx6output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include',
'../src/v4l2src/v4l2src.c', '-c', '-o', 'src/v4l2src/v4l2src.c.1.o']
make[1]: ***
[/home/ganhx/work/buildroot/qt5-buildroot/mx6output/build/gst1-imx-0.12.1/.stamp_built]
Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
