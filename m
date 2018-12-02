From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:28 -0000
Subject: [Buildroot] [git commit] eudev: bump to version 3.2.7
Message-ID: <20181202071555.839668A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b9d92102b0a84c545758b603f6d5485c88e87c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/eudev.hash | 4 ++--
 package/eudev/eudev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 3fa47980ec..33556a2d25 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,5 +1,5 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5 6ca08c0e14380f87df8e8aceac123671  eudev-3.2.5.tar.gz
+md5 c75d99910c1791dd9430d26ab76059c0  eudev-3.2.7.tar.gz
 # Locally calculated
-sha256 49c2d04105cad2526302627e040fa24b1916a9a3e059539bc8bb919b973890af  eudev-3.2.5.tar.gz
+sha256 3004614bd253c1f98558460215027aaf60d7592c70be27fd384ec01db87bf062  eudev-3.2.7.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 11dc93762b..d88e010c28 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.5
+EUDEV_VERSION = 3.2.7
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
