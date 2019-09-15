From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 21:53:09 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXpm: add license
 file, add hashes
Message-ID: <20190915195217.EAB268E5B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14930e191e61872c87fa32522385e1e9c4f5aebe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add COPYRIGHT to LICENSE_FILES, and add hashes for both license files.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 3 +++
 package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index d94a902682..d7389128ff 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,2 +1,5 @@
 # From https://lists.x.org/archives/xorg-announce/2016-December/002752.html
 sha256 fd6a6de3da48de8d1bb738ab6be4ad67f7cb0986c39bd3f7d51dd24f7854bdec  libXpm-3.5.12.tar.bz2
+# Locally calculated
+sha256 ed3b06bb3b75a0954bd6837a96b41a4676f60dfeee647271613aadecc0fd596e COPYING
+sha256 cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71 COPYRIGHT
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 391493a4ba..0c7f69e16e 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -8,7 +8,7 @@ XLIB_LIBXPM_VERSION = 3.5.12
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
 XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
-XLIB_LIBXPM_LICENSE_FILES = COPYING
+XLIB_LIBXPM_LICENSE_FILES = COPYING COPYRIGHT
 XLIB_LIBXPM_INSTALL_STAGING = YES
 # we patch configure.ac
 XLIB_LIBXPM_AUTORECONF = YES
