From: Julien Grossholtz <julien.grossholtz@openest.io>
Date: Thu, 31 Oct 2019 23:03:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: bump to version 4.2.0
Message-ID: <20191031220306.122761-1-julien.grossholtz@openest.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WolfSSL 4.2.0 has been released, it includes new features and fixes. The
full changelog is available here [1].

Update the wolfssl package to stable version 4.2.0 and the
corresponding hash file.

[1] https://www.wolfssl.com/docs/wolfssl-changelog/

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 997f008499..f2432390d5 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 f0d630c3ddfeb692b8ae38cc739f47d5e9f0fb708662aa241ede0c42a5eb3dd8  v4.1.0-stable.tar.gz
+sha256 3562af485c26cd7abe94d9404fbfc0c5c9bceb4aab29b81ebf5e6c2467507e12 v4.2.0-stable.tar.gz
 
 # Hash for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 807f8087ca..fd5fa35625 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.1.0
+WOLFSSL_VERSION = 4.2.0
 WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
 WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
 WOLFSSL_INSTALL_STAGING = YES
-- 
2.23.0
