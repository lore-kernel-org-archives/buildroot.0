From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 23 Jan 2018 15:28:14 +0200
Subject: [Buildroot] [PATCH] dos2unix: bump to version 7.4.0
Message-ID: <56242740fd5cdf0dd55f98bcc05f207893a5b36a.1516714094.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license hash.

Add reference to upstream tarball signature.

Cc: David Bachelart <david.bachelart@bbright.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dos2unix/dos2unix.hash | 4 +++-
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 1169592fce44..80b739495d96 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	8ccda7bbc5a2f903dafd95900abb5bf5e77a769b572ef25150fde4056c5f30c5	dos2unix-7.3.4.tar.gz
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.0.tar.gz.asc
+sha256	bac765abdbd95cdd87a71989d4382c32cf3cbfeee2153f0086cb9cf18261048a	dos2unix-7.4.0.tar.gz
+sha256	49224e841621b52a72aa38d8ac895a396cd3fa1395190bdfc9252378001eb3c0	COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 276a18ebcc76..9b823405902e 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.3.4
+DOS2UNIX_VERSION = 7.4.0
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.15.1
