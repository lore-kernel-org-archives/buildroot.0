From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Mar 2019 12:07:32 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/unixodbc: bump to version 2.3.7
Message-ID: <20190303110732.352-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unixodbc/unixodbc.hash | 6 +++---
 package/unixodbc/unixodbc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
index 9d21a66e8d..4d0ad191d1 100644
--- a/package/unixodbc/unixodbc.hash
+++ b/package/unixodbc/unixodbc.hash
@@ -1,6 +1,6 @@
-# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.6.tar.gz.md5
-md5 a8629fd2953b04b4639d0a9d8a5cf9d1  unixODBC-2.3.6.tar.gz
+# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.7.tar.gz.md5
+md5 274a711b0c77394e052db6493840c6f9  unixODBC-2.3.7.tar.gz
 # Locally computed
-sha256 88b637f647c052ecc3861a3baa275c3b503b193b6a49ff8c28b2568656d14d69  unixODBC-2.3.6.tar.gz
+sha256 45f169ba1f454a72b8fcbb82abd832630a3bf93baa84731cf2949f449e1e3e77  unixODBC-2.3.7.tar.gz
 sha256 a6b9aa1e9bfade121164c06fd975e9b913a8e38bf33d25ff967dfa3ed07d12f8  COPYING
 sha256 1e594f4c7fd6d099eca4bd1340b39d871ce0298331d8ebd4b68935548ee45cf4  exe/COPYING
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 423f395212..2c936fe9d5 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNIXODBC_VERSION = 2.3.6
+UNIXODBC_VERSION = 2.3.7
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
 UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
 UNIXODBC_INSTALL_STAGING = YES
-- 
2.14.1
