From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:50:53 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXvMC: bump version
 to 1.0.12
Message-ID: <20190928194545.3E9188144E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fefd74dec5f5b0413ffbbd43d5991a95b91e5e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.hash | 11 ++++++-----
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk   |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
index ac8457870c..be4ba751aa 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
@@ -1,7 +1,8 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002981.html
-md5 707175185a2e0490b8173686c657324f  libXvMC-1.0.11.tar.bz2
-sha1 9dbcb89c8adc7709b8a70ea0cde168f69d06859f  libXvMC-1.0.11.tar.bz2
-sha256 4a2e34d444a683a7c010b01b23cefe2b8043a063ce4dc6a9b855836b5262622d  libXvMC-1.0.11.tar.bz2
-sha512 4fe49e956ac97a45d851292cbba7bf242706aaf3bd9eb7ea4d2fc50e40745115d857a4fe179d2b87bc7cb6f9ac93911e89a167f02f6d1ae25a59df9a517a2476  libXvMC-1.0.11.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-September/003023.html
+md5 3569ff7f3e26864d986d6a21147eaa58  libXvMC-1.0.12.tar.bz2
+sha1 4871f92a83faa86aff5c630a2d6016c67bf11b97  libXvMC-1.0.12.tar.bz2
+sha256 6b3da7977b3f7eaf4f0ac6470ab1e562298d82c4e79077765787963ab7966dcd  libXvMC-1.0.12.tar.bz2
+sha512 62cb9a72b20af3b081d2d555a253b0e2b8b26b31f4fad10bd3e53bbf96e1663b61bd8df2b78b16f18218cd37cce0c9e6809ae16ded226b37a8b199e41b223955  libXvMC-1.0.12.tar.bz2
+
 # Locally computed
 sha256 b7c709df281675a07eb60a71c5fa2599d1ef538eb79ae7ad6e774b10e4a804c4  COPYING
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 713abc7448..02959c2305 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXVMC_VERSION = 1.0.11
+XLIB_LIBXVMC_VERSION = 1.0.12
 XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.bz2
 XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
