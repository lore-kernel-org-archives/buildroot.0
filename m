From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Sep 2017 16:20:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/openmpi: bump version to 1.10.7
Message-ID: <20170916142022.18837-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openmpi/openmpi.hash | 6 ++++--
 package/openmpi/openmpi.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index 92152a2431..4e967e6589 100644
--- a/package/openmpi/openmpi.hash
+++ b/package/openmpi/openmpi.hash
@@ -1,3 +1,5 @@
 # From: https://www.open-mpi.org/software/ompi/v1.10/
-md5 b2f43d9635d2d52826e5ef9feb97fd4c  openmpi-1.10.2.tar.bz2
-sha1 03934fc0a2dd0d0d2d0459d714a976eabca938fb  openmpi-1.10.2.tar.bz2
+md5 c87c613f9acb1a4eee21fa1ac8042579  openmpi-1.10.7.tar.bz2
+sha1 fe359d8caa4888625308cf03343d913dd5ac6198  openmpi-1.10.7.tar.bz2
+# Locally computed
+sha256 a089ece151fec974905caa35b0a59039b227bdea4e7933069e94bee4ed0e5a90  openmpi-1.10.7.tar.bz2
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index 3ffde89aed..df3270f50a 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENMPI_VERSION_MAJOR = 1.10
-OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).2
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).7
 OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
 OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
-- 
2.11.0
