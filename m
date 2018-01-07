From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:07:23 +0100
Subject: [Buildroot] [git commit] package/zstd: bump version to v1.3.3
Message-ID: <20180107141229.D145081046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72052afc294b67c34825a320d368d983e9f1f3ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zstd/zstd.hash | 2 +-
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 5bcdde9..51e5fc2 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 ac5054a3c64e6510bc1ae890d05e3d271cc33ceebc9d06ac9f08105766d2798a zstd-v1.3.2.tar.gz
+sha256 a77c47153ee7de02626c5b2a097005786b71688be61e9fb81806a011f90b297b zstd-v1.3.3.tar.gz
 
 # License files (locally computed as well)
 sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 089d654..d5459f9 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = v1.3.2
+ZSTD_VERSION = v1.3.3
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
 ZSTD_LICENSE = BSD-3-Clause, GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
