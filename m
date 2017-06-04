From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:54:06 +0200
Subject: [Buildroot] [git commit] package/armadillo: bump version to 7.900.1
Message-ID: <20170604075413.8D78880770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53530cb994c780a606d1e0d5de58e77c5aa2b96f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed upstream URL to https, use .xz instead of .gz tarball.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/armadillo/armadillo.hash | 6 +++---
 package/armadillo/armadillo.mk   | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 4149a77..7fd599f 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,5 +1,5 @@
 # From http://sourceforge.net/projects/arma/files/?source=navbar
-md5	a39f27197d24b3d25437fab6bb1d118f		armadillo-6.500.4.tar.gz
-sha1	68166e67521a720c72917d196b0807bc6cab8b2e	armadillo-6.500.4.tar.gz
+md5 5ef71763bd429a3d481499878351f3be  armadillo-7.900.1.tar.xz
+sha1 8118faf1c6a7a39c55a1103a1f90e85e613cc377  armadillo-7.900.1.tar.xz
 # Locally computed:
-sha256	813de85fa61ba5077ed871d801ba7070d369e7e9742002e4c11474c75ff6d1c6	armadillo-6.500.4.tar.gz
+sha256 33eec7013990b5477ccc5ad3abc68bc2326c7a7a2790014d625cfcf37c0e07d3  armadillo-7.900.1.tar.xz
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index beb60c8..b5fe403 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 6.500.4
-# upstream removed tarball from
-# http://downloads.sourceforge.net/project/arma
-ARMADILLO_SITE = https://ftp.fau.de/macports/distfiles/armadillo
+ARMADILLO_VERSION = 7.900.1
+ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
+ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = MPL-2.0
