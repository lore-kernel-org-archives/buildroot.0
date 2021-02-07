From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2021 13:52:44 +0100
Subject: [Buildroot] [PATCH 1/2] package/libgsasl: bump version to 1.10.0
Message-ID: <20210207125245.1428105-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added hashes provided by upstream, updated license hash due to various
upstream commits:
https://git.savannah.gnu.org/gitweb/?p=gsasl.git;a=history;f=README

Release notes:
https://lists.gnu.org/archive/html/help-gsasl/2021-01/msg00007.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libgsasl/libgsasl.hash | 8 ++++++--
 package/libgsasl/libgsasl.mk   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
index 57fd98fc95..75e5a317fa 100644
--- a/package/libgsasl/libgsasl.hash
+++ b/package/libgsasl/libgsasl.hash
@@ -1,7 +1,11 @@
+# From https://lists.gnu.org/archive/html/help-gsasl/2021-01/msg00007.html
+sha1  a16ff428bbf28fcfa681c7edd2cd2bb087bcc4e7  libgsasl-1.10.0.tar.gz
+sha224  20b37757fccb6a0f8b4c6fcb28f51a3b4b8a4b1fdb4736da07707a0b  libgsasl-1.10.0.tar.gz
+
 # Locally calculated after checking pgp signature
-sha256  19e2f90525c531010918c50bb1febef0d7115d620150cc66153b9ce73ff814e6  libgsasl-1.8.1.tar.gz
+sha256  f1b553384dedbd87478449775546a358d6f5140c15cccc8fb574136fdc77329f  libgsasl-1.10.0.tar.gz
 
 # Hash for license files:
-sha256  185b5b29a3febbfe1ab0b1ec6b1a26df630be97a17a99b5d305fdfff3344c117  README
+sha256  26e99818ca6ce79d8b2c461fabc72dc6e03483e6b0fd9692dcb07ab1b09bbac7  README
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index 40e7c4c918..e813a354a1 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSASL_VERSION = 1.8.1
+LIBGSASL_VERSION = 1.10.0
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
 LIBGSASL_LICENSE_FILES = README COPYING.LIB COPYING
-- 
2.29.2
