From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri,  1 May 2020 07:13:05 -0300
Subject: [Buildroot] [PATCH] package/wolfssl: bump version to 4.4.0
Message-ID: <20200501101305.3066-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also change the hash file to separate the fields by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/wolfssl/wolfssl.hash | 6 +++---
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 5509552ca4e3..4a1aeebe7d71 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256 6896f8ad6c44aff3e583006eeee839600848a0e37118ebbb7514eca9409ae08b  wolfssl-4.3.0-stable.tar.gz
+sha256  7f854804c8ae0ca49cc77809e38e9a3b5a8c91ba7855ea928e6d6651b0d35f18  wolfssl-4.4.0-stable.tar.gz
 
 # Hash for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 74adaaef40b96c71378b6daa3feb8ccd4a1bfd9b76debf3f3f29cf3a0e86c9a0  LICENSING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  74adaaef40b96c71378b6daa3feb8ccd4a1bfd9b76debf3f3f29cf3a0e86c9a0  LICENSING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 8834a0f46826..e3062c39b599 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.3.0-stable
+WOLFSSL_VERSION = 4.4.0-stable
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
 WOLFSSL_INSTALL_STAGING = YES
 
-- 
2.17.1
