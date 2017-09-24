From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:15:33 +0200
Subject: [Buildroot] [git commit] package/openmpi: bump version to 1.10.7
Message-ID: <20170924132001.583227FF37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e9112f0a4d78ff89584734e743778a29e730f96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openmpi/openmpi.hash | 6 ++++--
 package/openmpi/openmpi.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index 92152a2..4e967e6 100644
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
index 3ffde89..df3270f 100644
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
