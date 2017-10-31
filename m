From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Oct 2017 22:56:07 +0100
Subject: [Buildroot] [git commit] package/w_scan: bump version to 20170107
Message-ID: <20171031215037.C917380FF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0762015f144fa6255f84511e0f58824af18e8000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/w_scan/0001-musl.patch | 4 ++--
 package/w_scan/w_scan.hash     | 2 +-
 package/w_scan/w_scan.mk       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/w_scan/0001-musl.patch b/package/w_scan/0001-musl.patch
index 7633d55..46d6767 100644
--- a/package/w_scan/0001-musl.patch
+++ b/package/w_scan/0001-musl.patch
@@ -20,7 +20,7 @@ diff -uNr w_scan-20141122.org/version.h w_scan-20141122/version.h
  /* AUTOMATICALLY GENERATED - DO NOT EDIT MANUALLY */
  #ifndef W_SCAN_VERSION_H
  #define W_SCAN_VERSION_H
--uint version=20141122;
-+unsigned int version=20141122;
+-uint version=20170107;
++unsigned int version=20170107;
  #endif
  
diff --git a/package/w_scan/w_scan.hash b/package/w_scan/w_scan.hash
index 4c336f3..e04a084 100644
--- a/package/w_scan/w_scan.hash
+++ b/package/w_scan/w_scan.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b6d7c9ab997c53a0b0d92e8390f313cc3b82ee8ece1756b4e526119fd5ba09b4  w_scan-20141122.tar.bz2
+sha256 38e0f38a7bf06cff6d6ea01652ad4ee60da2cb0e937360468f936da785b46ffe  w_scan-20170107.tar.bz2
diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
index cdb4250..c63f20c 100644
--- a/package/w_scan/w_scan.mk
+++ b/package/w_scan/w_scan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-W_SCAN_VERSION = 20141122
+W_SCAN_VERSION = 20170107
 W_SCAN_SOURCE = w_scan-$(W_SCAN_VERSION).tar.bz2
 W_SCAN_SITE = http://wirbel.htpc-forum.de/w_scan
 W_SCAN_LICENSE = GPL-2.0+
