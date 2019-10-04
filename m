From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  4 Oct 2019 15:18:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/libpqxx: bump version to 6.4.5
Message-ID: <20191004131806.25582-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash after upstream commit
https://github.com/jtv/libpqxx/commit/d9ac0a5be0052528cb3f689af153332836fde58f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libpqxx/libpqxx.hash | 4 ++--
 package/libpqxx/libpqxx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index b04e3c3198..8e3164937f 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	36fcf8439ac7f7cc68b21e95b20e921ece4487cda1cc1d09b798a84e7cb3a4b7	libpqxx-6.2.5.tar.gz
-sha256	9e1c78fa302e4e9738bf3315b130429035c03fcb0f046531ccd977cb474f6b31	COPYING
+sha256	86921fdb0fe54495a79d5af2c96f2c771098c31e9b352d0834230fd2799ad362	libpqxx-6.4.5.tar.gz
+sha256	36c48c1ca1b0a68639d919196b5d92c971858ad8e24da24385ba1c65cc5eac38	COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 9e0f84db82..9de7df3ed2 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 6.2.5
+LIBPQXX_VERSION = 6.4.5
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
-- 
2.20.1
