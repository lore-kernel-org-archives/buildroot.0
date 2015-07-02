From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 11:03:06 +0200
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump version
	to 1.6.0
Message-ID: <20150702090456.00CDE818D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=860b3a7b9aeae64f43e5f45054ae8dfd74666c14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream hash is in sha1 format, like before. It is wrongly announced
as md5 in the release mail, so I added a note to the hash file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libva-intel-driver/libva-intel-driver.hash |    4 ++--
 package/libva-intel-driver/libva-intel-driver.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index b03bb1d..57010bc 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/libva/2015-March/003250.html
-sha1	98b670517cbd2d0e5e2ef3f171b805815dff9057	libva-intel-driver-1.5.1.tar.bz2
+# From http://lists.freedesktop.org/archives/libva/2015-July/003405.html, checked locally
+sha1	8d9da76883429a155511ee0e71a737aea07ad217	libva-intel-driver-1.6.0.tar.bz2
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index 8469314..a61f55e 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 1.5.1
+LIBVA_INTEL_DRIVER_VERSION = 1.6.0
 LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
 LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
 LIBVA_INTEL_DRIVER_LICENSE = MIT
