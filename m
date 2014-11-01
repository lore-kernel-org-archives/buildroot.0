From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 14:45:46 +0100
Subject: [Buildroot] [git commit] rdesktop: bump to version 1.8.3
Message-ID: <20141101134604.47F1DB27AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26c32cfe430908afd1f810171f71d84510b76702
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rdesktop/rdesktop.hash |    3 +++
 package/rdesktop/rdesktop.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/rdesktop/rdesktop.hash b/package/rdesktop/rdesktop.hash
new file mode 100644
index 0000000..cc1f55b
--- /dev/null
+++ b/package/rdesktop/rdesktop.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/rdesktop/files/rdesktop/1.8.3/
+md5	86e8b368a7c715e74ded92e0d7912dc5	rdesktop-1.8.3.tar.gz
+sha1	aa1e56043782e04a0121357b24874e3ad6ae7b1d	rdesktop-1.8.3.tar.gz
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index ea1e505..79187b5 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDESKTOP_VERSION = 1.8.2
+RDESKTOP_VERSION = 1.8.3
 RDESKTOP_SITE = http://downloads.sourceforge.net/project/rdesktop/rdesktop/$(RDESKTOP_VERSION)
 RDESKTOP_DEPENDENCIES = host-pkgconf openssl xlib_libX11 xlib_libXt \
 	$(if $(BR2_PACKAGE_ALSA_LIB_PCM),alsa-lib) \
