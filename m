From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 11:44:31 +0100
Subject: [Buildroot] [git commit branch/2016.11.x]
	package/x11r7/xlib_libXpm: bump version to 3.5.12
Message-ID: <20170125104623.C2FA7803FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d09bfa43f26930566e4dc704c03b5e2599e33af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes CVE-2016-10164: The affected code is prone to two 32 bit integer
overflows while parsing extensions: the amount of extensions and their
concatenated length.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e9f66e194a43e9dac4a8c88bcb5b3253845cd805)
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 4 ++--
 package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index 22c9fc6..d94a902 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/xorg/2013-September/056010.html
-sha256	c5bdafa51d1ae30086fac01ab83be8d47fe117b238d3437f8e965434090e041c	libXpm-3.5.11.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-December/002752.html
+sha256 fd6a6de3da48de8d1bb738ab6be4ad67f7cb0986c39bd3f7d51dd24f7854bdec  libXpm-3.5.12.tar.bz2
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 997ef95..c8c5496 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.11
+XLIB_LIBXPM_VERSION = 3.5.12
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
 XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
