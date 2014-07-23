From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 21:53:02 +0200
Subject: [Buildroot] [git commit] rpi-userland: add missing library in .pc
	file
Message-ID: <20140723195336.91FDB9D2D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a29ce0d1648baccb311e78c7c906ca27255e895
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/8df/8dfb6cba6ea27af253b391cdd355a456382f17a4/

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../rpi-userland-000-add-pkgconfig-files.patch     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
index 848e49d..e88f810 100644
--- a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
+++ b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
@@ -19,7 +19,7 @@ Index: b/interface/khronos/egl/egl.pc.in
 +Name: egl
 +Description: RasberryPi implementation of EGL
 +Version: 10
-+Libs: -L${libdir} -lEGL -lGLESv2 -lbcm_host
++Libs: -L${libdir} -lEGL -lGLESv2 -lbcm_host -lvchostif
 +Cflags: -I${includedir}/ -I${includedir}/interface/vcos/pthreads/ \
 +        -I${includedir}/interface/vmcs_host/linux/
 Index: b/interface/khronos/CMakeLists.txt
