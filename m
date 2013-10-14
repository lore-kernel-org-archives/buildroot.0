From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 12:59:54 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: expose appropriate
	EGL version
Message-ID: <20131014112355.347009B9F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8938bf47d06e445c86d02403122c39926f1d036
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The egl.pc file installed exposes version 1.0, while it really is a
much higher version.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../rpi-userland-000-add-pkgconfig-files.patch     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
index d7984ff..848e49d 100644
--- a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
+++ b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
@@ -18,7 +18,7 @@ Index: b/interface/khronos/egl/egl.pc.in
 +
 +Name: egl
 +Description: RasberryPi implementation of EGL
-+Version: 1.0
++Version: 10
 +Libs: -L${libdir} -lEGL -lGLESv2 -lbcm_host
 +Cflags: -I${includedir}/ -I${includedir}/interface/vcos/pthreads/ \
 +        -I${includedir}/interface/vmcs_host/linux/
