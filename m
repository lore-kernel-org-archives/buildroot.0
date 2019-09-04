From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 21:32:44 +0200
Subject: [Buildroot] [git commit] package/wolfssl: bump to version 4.1.0
Message-ID: <20190904194019.DD8008B45A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2ae7c2c30a0d417844c65e8278b749cc646abce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 6559486a18..997f008499 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 6cf678c72b485d1904047c40c20f85104c96b5f39778822783a2c407ccb23657  v4.0.0-stable.tar.gz
+sha256 f0d630c3ddfeb692b8ae38cc739f47d5e9f0fb708662aa241ede0c42a5eb3dd8  v4.1.0-stable.tar.gz
 
 # Hash for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 5ef182806a..807f8087ca 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.0.0
+WOLFSSL_VERSION = 4.1.0
 WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
 WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
 WOLFSSL_INSTALL_STAGING = YES
