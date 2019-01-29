From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Jan 2019 20:35:25 +0100
Subject: [Buildroot] [PATCH 1/1] openmpi: bump to version 4.0.0
Message-ID: <20190129193525.26908-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for licence file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openmpi/openmpi.hash | 9 +++++----
 package/openmpi/openmpi.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index 4e967e6589..4e76951c8f 100644
--- a/package/openmpi/openmpi.hash
+++ b/package/openmpi/openmpi.hash
@@ -1,5 +1,6 @@
-# From: https://www.open-mpi.org/software/ompi/v1.10/
-md5 c87c613f9acb1a4eee21fa1ac8042579  openmpi-1.10.7.tar.bz2
-sha1 fe359d8caa4888625308cf03343d913dd5ac6198  openmpi-1.10.7.tar.bz2
+# From: https://www.open-mpi.org/software/ompi/v4.0/
+md5 e3da67df1e968c8798827e0e5fe9a510  openmpi-4.0.0.tar.bz2
+sha1 fee1d0287abfb150bae16957de342752c9bdd4e8  openmpi-4.0.0.tar.bz2
 # Locally computed
-sha256 a089ece151fec974905caa35b0a59039b227bdea4e7933069e94bee4ed0e5a90  openmpi-1.10.7.tar.bz2
+sha256 2f0b8a36cfeb7354b45dda3c5425ef8393c9b04115570b615213faaa3f97366b  openmpi-4.0.0.tar.bz2
+sha256 8298a80ed5f09cfd007bae1c0e7d67d1c2810c6389876778dad070c31a691dac  LICENSE
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index df3270f50a..8d9eafd631 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENMPI_VERSION_MAJOR = 1.10
-OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).7
+OPENMPI_VERSION_MAJOR = 4.0
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).0
 OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
 OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
-- 
2.14.1
