From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:33:30 +0100
Subject: [Buildroot] [git commit] package/eudev: bump version to 3.2.9
Message-ID: <20191027102800.1B6B288F69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4b729f77d20e6973cb72087304adf5173c32f98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/eudev/eudev.hash | 4 ++--
 package/eudev/eudev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index d1541d0c82..e6a319ac44 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,5 +1,5 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5 ce166b3fdd910c2a4a840378f48fedaf  eudev-3.2.8.tar.gz
+md5 dedfb1964f6098fe9320de827957331f  eudev-3.2.9.tar.gz
 # Locally calculated
-sha256 61e4948e9e51271c3cce2bb5311a30b206dd03ef011062e6c627fb007e43f6b8  eudev-3.2.8.tar.gz
+sha256 89618619084a19e1451d373c43f141b469c9fd09767973d73dd268b92074d4fc  eudev-3.2.9.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index c5fbee8b9b..2a3adb849c 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.8
+EUDEV_VERSION = 3.2.9
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
