From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:19:28 +0200
Subject: [Buildroot] [git commit] package/eudev: bump version to 3.2.8
Message-ID: <20190622181943.BCD0E7FA52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0613c5ef34966ed5b1f64ab184387cf48e795bc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/eudev/eudev.hash | 4 ++--
 package/eudev/eudev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 33556a2d25..d1541d0c82 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,5 +1,5 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5 c75d99910c1791dd9430d26ab76059c0  eudev-3.2.7.tar.gz
+md5 ce166b3fdd910c2a4a840378f48fedaf  eudev-3.2.8.tar.gz
 # Locally calculated
-sha256 3004614bd253c1f98558460215027aaf60d7592c70be27fd384ec01db87bf062  eudev-3.2.7.tar.gz
+sha256 61e4948e9e51271c3cce2bb5311a30b206dd03ef011062e6c627fb007e43f6b8  eudev-3.2.8.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index d88e010c28..78d0ea670e 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.7
+EUDEV_VERSION = 3.2.8
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
