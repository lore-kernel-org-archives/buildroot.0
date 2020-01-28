From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 23:21:13 +0100
Subject: [Buildroot] [git commit] package/aircrack-ng: bump to version 1.6
Message-ID: <20200128221533.28A2D8404E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10c42859f016bb6bd339c4cd21061f9590dc5ccc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Laurent Cans <laurent.cans@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aircrack-ng/aircrack-ng.hash | 4 ++--
 package/aircrack-ng/aircrack-ng.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/aircrack-ng/aircrack-ng.hash b/package/aircrack-ng/aircrack-ng.hash
index d8a171dc07..990c3ef563 100644
--- a/package/aircrack-ng/aircrack-ng.hash
+++ b/package/aircrack-ng/aircrack-ng.hash
@@ -1,6 +1,6 @@
 # From http://www.aircrack-ng.org/downloads.html
-sha1 7b63c7ce01cb65a4775833c6cadf7ddd82bf46d5 aircrack-ng-1.5.2.tar.gz
-md5 2648c192d206e953c67dca64967d2982 aircrack-ng-1.5.2.tar.gz
+sha1 ffeb4816476e7b329dc0c154f1aa4a30ad171beb aircrack-ng-1.6.tar.gz
+md5  22ddc85549b51ed0da0931d01ef215e5 aircrack-ng-1.6.tar.gz
 
 # Hash for license file:
 sha256 fc51fd3a97223f2fd47b057202d4a6b0daaedf23b5a1f5ff8723c192fc1e021d LICENSE
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index a6db384b84..baa1fad9e1 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AIRCRACK_NG_VERSION = 1.5.2
+AIRCRACK_NG_VERSION = 1.6
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
