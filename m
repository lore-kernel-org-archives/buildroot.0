From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jan 2018 15:32:32 +0100
Subject: [Buildroot] [git commit] dos2unix: bump to version 7.4.0
Message-ID: <20180123143331.3BAFF802C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2f028e27c87865403fa91482c47d0a3186fecef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license hash.

Add reference to upstream tarball signature.

Cc: David Bachelart <david.bachelart@bbright.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dos2unix/dos2unix.hash | 4 +++-
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 1169592..80b7394 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	8ccda7bbc5a2f903dafd95900abb5bf5e77a769b572ef25150fde4056c5f30c5	dos2unix-7.3.4.tar.gz
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.0.tar.gz.asc
+sha256	bac765abdbd95cdd87a71989d4382c32cf3cbfeee2153f0086cb9cf18261048a	dos2unix-7.4.0.tar.gz
+sha256	49224e841621b52a72aa38d8ac895a396cd3fa1395190bdfc9252378001eb3c0	COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 276a18e..9b82340 100644
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
