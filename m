From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Jul 2017 11:12:22 +0200
Subject: [Buildroot] [git commit] libssh2: bump to version 1.8.0
Message-ID: <20170709091155.4A9B3802D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dcf75eb7dfc545ddf47a156b76bedb2a2d86526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh2/libssh2.hash | 3 ++-
 package/libssh2/libssh2.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index 8f6268f..6b1cced 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256	e4561fd43a50539a8c2ceb37841691baf03ecb7daf043766da1b112e4280d584	libssh2-1.7.0.tar.gz
+# https://www.libssh2.org/download/libssh2-1.8.0.tar.gz.asc
+sha256	39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4	libssh2-1.8.0.tar.gz
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 847c2f1..ab721ac 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1.7.0
+LIBSSH2_VERSION = 1.8.0
 LIBSSH2_SITE = http://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
