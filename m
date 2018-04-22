From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 14:42:10 +0200
Subject: [Buildroot] [git commit] package/unixodbc: bump version to 2.3.6
Message-ID: <20180422124241.B87DD886F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8cac2aa8e09cfc4870bab8768a31499de8ded89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unixodbc/unixodbc.hash | 8 +++++---
 package/unixodbc/unixodbc.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
index e99169c15d..9d21a66e8d 100644
--- a/package/unixodbc/unixodbc.hash
+++ b/package/unixodbc/unixodbc.hash
@@ -1,4 +1,6 @@
-# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.4.tar.gz.md5
-md5 bd25d261ca1808c947cb687e2034be81  unixODBC-2.3.4.tar.gz
+# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.6.tar.gz.md5
+md5 a8629fd2953b04b4639d0a9d8a5cf9d1  unixODBC-2.3.6.tar.gz
 # Locally computed
-sha256 2e1509a96bb18d248bf08ead0d74804957304ff7c6f8b2e5965309c632421e39  unixODBC-2.3.4.tar.gz
+sha256 88b637f647c052ecc3861a3baa275c3b503b193b6a49ff8c28b2568656d14d69  unixODBC-2.3.6.tar.gz
+sha256 a6b9aa1e9bfade121164c06fd975e9b913a8e38bf33d25ff967dfa3ed07d12f8  COPYING
+sha256 1e594f4c7fd6d099eca4bd1340b39d871ce0298331d8ebd4b68935548ee45cf4  exe/COPYING
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index d4aa02eea3..423f395212 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNIXODBC_VERSION = 2.3.4
+UNIXODBC_VERSION = 2.3.6
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
 UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
 UNIXODBC_INSTALL_STAGING = YES
