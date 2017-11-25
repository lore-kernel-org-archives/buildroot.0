From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 13:21:32 +0100
Subject: [Buildroot] [git commit] package/eudev: bump version to 3.2.5
Message-ID: <20171201205337.961D17FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee967f28cd2da7865425822afb919afe72a5cff9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/eudev.hash | 5 +++--
 package/eudev/eudev.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 75f2cc1..3fa4798 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,4 +1,5 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5 66acef4c6094aab4aced7ae83b74b0d2  eudev-3.2.4.tar.gz
+md5 6ca08c0e14380f87df8e8aceac123671  eudev-3.2.5.tar.gz
 # Locally calculated
-sha256 dddcf4c89b21f5f3210f7e4d3888c92cbfc657ff734ac21b6bdd3f5bcb146fed  eudev-3.2.4.tar.gz
+sha256 49c2d04105cad2526302627e040fa24b1916a9a3e059539bc8bb919b973890af  eudev-3.2.5.tar.gz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index b712475..d08b9bb 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.4
+EUDEV_VERSION = 3.2.5
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
