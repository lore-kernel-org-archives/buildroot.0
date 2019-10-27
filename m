From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:34:35 +0100
Subject: [Buildroot] [git commit] package/doxygen: bump version to 1.8.16
Message-ID: <20191027102800.2824488F38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6551b58721e1a787b547fa2f9ae990e35931e437
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/doxygen/doxygen.hash | 3 ++-
 package/doxygen/doxygen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
index db70b74d23..375d3e0aed 100644
--- a/package/doxygen/doxygen.hash
+++ b/package/doxygen/doxygen.hash
@@ -1,2 +1,3 @@
 # Computed locally
-sha256 d1757e02755ef6f56fd45f1f4398598b920381948d6fcfa58f5ca6aa56f59d4d  doxygen-1.8.14.src.tar.gz
+sha256 ff981fb6f5db4af9deb1dd0c0d9325e0f9ba807d17bd5750636595cf16da3c82  doxygen-1.8.16.src.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index 5e11a1d187..ce240ae64e 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOXYGEN_VERSION = 1.8.14
+DOXYGEN_VERSION = 1.8.16
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
-DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri
+DOXYGEN_SITE = http://doxygen.nl/files
 DOXYGEN_LICENSE = GPL-2.0
 DOXYGEN_LICENSE_FILES = LICENSE
 HOST_DOXYGEN_DEPENDENCIES = host-flex host-bison
