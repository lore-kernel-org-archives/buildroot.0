From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Mar 2021 22:46:19 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libopenssl:
 security bump version to 1.1.1k
Message-ID: <20210328202156.2611588529@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ea19568aa4f311e2410eea051bf6313eaf99d9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes CVE-2021-3449 & CVE-2021-3450:
https://www.openssl.org/news/vulnerabilities-1.1.1.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 198e20921fa7afde88773d40564d0aa5e81d4419)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 854f8a03f7..585486ffbe 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1j.tar.gz.sha256
-sha256  aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf  openssl-1.1.1j.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1k.tar.gz.sha256
+sha256  892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5  openssl-1.1.1k.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 19f1c89f06..a10b64c8fd 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1j
+LIBOPENSSL_VERSION = 1.1.1k
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
