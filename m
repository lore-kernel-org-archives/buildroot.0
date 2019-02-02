From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Feb 2019 15:00:17 +0100
Subject: [Buildroot] [git commit] package/aircrack-ng: bump to version 1.5.2
Message-ID: <20190202135913.BBE98801CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5149435e473df8b8662fbc6725d8e6f70175c975
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aircrack-ng/aircrack-ng.hash | 4 ++--
 package/aircrack-ng/aircrack-ng.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/aircrack-ng/aircrack-ng.hash b/package/aircrack-ng/aircrack-ng.hash
index 031e803eee..d8a171dc07 100644
--- a/package/aircrack-ng/aircrack-ng.hash
+++ b/package/aircrack-ng/aircrack-ng.hash
@@ -1,6 +1,6 @@
 # From http://www.aircrack-ng.org/downloads.html
-sha1 22bae2c6f21e463df62b4c06c9c3c45c42a9b4ea aircrack-ng-1.4.tar.gz
-md5 24e22f6f6eca1e7dc0d203e5719d3e8d aircrack-ng-1.3.tar.gz
+sha1 7b63c7ce01cb65a4775833c6cadf7ddd82bf46d5 aircrack-ng-1.5.2.tar.gz
+md5 2648c192d206e953c67dca64967d2982 aircrack-ng-1.5.2.tar.gz
 
 # Hash for license file:
 sha256 fc51fd3a97223f2fd47b057202d4a6b0daaedf23b5a1f5ff8723c192fc1e021d LICENSE
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 64dc15a4aa..a6db384b84 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AIRCRACK_NG_VERSION = 1.4
+AIRCRACK_NG_VERSION = 1.5.2
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
