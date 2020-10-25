From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Oct 2020 11:31:30 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/liblo: bump to version 0.31
Message-ID: <20201025103130.419099-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

http://liblo.sourceforge.net/NEWS.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix package name

 package/liblo/liblo.hash | 10 +++++-----
 package/liblo/liblo.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index 049ab80747..a3d34d796c 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.30/
-sha1	152a3260d186f111a71508dc0ed709984960f130	liblo-0.30.tar.gz
-md5	fa1a9d45f86fc18fb54019f670ff2262		liblo-0.30.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.31/
+sha1  d188a62df51e29fa98861daec1db0fdae400410d  liblo-0.31.tar.gz
+md5  14378c1e74c58e777fbb4fcf33ac5315  liblo-0.31.tar.gz
 
 # Locally computed
-sha256	  30a7c9de49a25ed7f2425a7a7415f5b14739def62431423d3419ea26fb978d1b	liblo-0.30.tar.gz
-sha256	  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	COPYING
+sha256  2b4f446e1220dcd624ecd8405248b08b7601e9a0d87a0b94730c2907dbccc750  liblo-0.31.tar.gz
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 69918186db..27dba1f99f 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.30
+LIBLO_VERSION = 0.31
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
-- 
2.28.0
