From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:35:55 +0100
Subject: [Buildroot] [git commit] lzip: bump to version 1.18
Message-ID: <20170209203618.CAACA81938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=037d06f2d7b896f5835e41041dc55f5adabdf310
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, correct license.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzip/lzip.hash | 4 +++-
 package/lzip/lzip.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 7b83e3e..8855231 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,2 +1,4 @@
+# From http://lists.nongnu.org/archive/html/lzip-bug/2016-06/msg00002.html
+sha1	ef42f3209d02c3b3c217a61c8f127bcb8747b128	lzip-1.18.tar.gz
 # Locally calculated after checking pgp signature
-sha256	7cd3fcda68fc9900efcf7784313e3bdd1303fef1a0546db9723f5e5564dd05b6	lzip-1.15.tar.gz
+sha256	47f9882a104ab05532f467a7b8f4ddbb898fa2f1e8d9d468556d6c2d04db14dd	lzip-1.18.tar.gz
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 8180fd0..db04862 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.15
+LZIP_VERSION = 1.18
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
-LZIP_LICENSE = GPLv3+
+LZIP_LICENSE = GPLv2+
 LZIP_LICENSE_FILES = COPYING
 
 define LZIP_CONFIGURE_CMDS
