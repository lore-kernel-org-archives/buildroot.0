From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:21:15 +0200
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump version
	to 1.4.1
Message-ID: <20141024232207.05C99B0BC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb6fae779128bbff042464b18b6a4a1d50de2d99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva-intel-driver/libva-intel-driver.hash |    4 ++--
 package/libva-intel-driver/libva-intel-driver.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index de56015..cf64423 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2014-September/002747.html
-sha1	2d4f40c5d239f3a8f4671b27e6fd2da8652dc546	libva-intel-driver-1.4.0.tar.bz2
+# http://lists.freedesktop.org/archives/libva/2014-October/002779.html
+sha1	441cc9c0b51eb90ede79609111d0944b4f2ff682	libva-intel-driver-1.4.1.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 5aed95b..175c085 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.4.0
+LIBVA_INTEL_DRIVER_VERSION = 1.4.1
 LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
