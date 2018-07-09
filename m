From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jul 2018 23:51:32 +0200
Subject: [Buildroot] [git commit] szip: bump to version 2.1.1
Message-ID: <20180709214918.83C8B7FADB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7627223c9beccc19eda43ce7213305afbcec328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/szip/szip.hash | 3 ++-
 package/szip/szip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/szip/szip.hash b/package/szip/szip.hash
index c6caf36481..3b582d901d 100644
--- a/package/szip/szip.hash
+++ b/package/szip/szip.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 a816d95d5662e8279625abdbea7d0e62157d7d1f028020b1075500bf483ed5ef szip-2.1.tar.gz
+sha256 21ee958b4f2d4be2c9cabfa5e1a94877043609ce86fde5f286f105f7ff84d412 szip-2.1.1.tar.gz
+sha256 98cc66747133b26563fefc4630ad4c8c7848c722c7b8a60ecd4afbc4c7d7eb01 COPYING
diff --git a/package/szip/szip.mk b/package/szip/szip.mk
index f3a47581bf..7a8a5a82e6 100644
--- a/package/szip/szip.mk
+++ b/package/szip/szip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SZIP_VERSION = 2.1
-SZIP_SITE = http://www.hdfgroup.org/ftp/lib-external/szip/2.1/src
+SZIP_VERSION = 2.1.1
+SZIP_SITE = http://www.hdfgroup.org/ftp/lib-external/szip/2.1.1/src
 SZIP_LICENSE = szip license
 SZIP_LICENSE_FILES = COPYING
 SZIP_INSTALL_STAGING = YES
