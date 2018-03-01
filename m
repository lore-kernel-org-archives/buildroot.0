From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  1 Mar 2018 07:56:37 +0200
Subject: [Buildroot] [PATCH next] lzip: bump to version 1.20
Message-ID: <a62805a4cacc8c599d6d8647636f01635667735e.1519883797.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lzip/lzip.hash | 6 ++++--
 package/lzip/lzip.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index e074c76005c5..9945f9cfe557 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,2 +1,4 @@
-# From http://lists.nongnu.org/archive/html/lzip-bug/2017-05/msg00000.html
-sha256 ffadc4f56be1bc0d3ae155ec4527bd003133bdc703a753b2cc683f610e646ba9 lzip-1.19.tar.gz
+# From http://lists.nongnu.org/archive/html/lzip-bug/2018-02/msg00006.html
+sha256 c93b81a5a7788ef5812423d311345ba5d3bd4f5ebf1f693911e3a13553c1290c lzip-1.20.tar.gz
+# Locally calculated
+sha256 3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index b7ba5dd21df0..4088662de2d9 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.19
+LZIP_VERSION = 1.20
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
-- 
2.16.1
