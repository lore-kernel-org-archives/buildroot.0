From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2020 14:57:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/lzip: bump version to 1.21
Message-ID: <20200413125725.882889-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lzip/lzip.hash | 4 ++--
 package/lzip/lzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 9945f9cfe5..bb74467c9a 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From http://lists.nongnu.org/archive/html/lzip-bug/2018-02/msg00006.html
-sha256 c93b81a5a7788ef5812423d311345ba5d3bd4f5ebf1f693911e3a13553c1290c lzip-1.20.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2019-01/msg00010.html
+sha256 e48b5039d3164d670791f9c5dbaa832bf2df080cb1fbb4f33aa7b3300b670d8b lzip-1.21.tar.gz
 # Locally calculated
 sha256 3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 72742240a5..2a9a079cde 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.20
+LZIP_VERSION = 1.21
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
-- 
2.25.0
