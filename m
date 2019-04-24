From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 21:25:23 +0200
Subject: [Buildroot] [git commit] package/wolfssl: bump to version 4.0.0
Message-ID: <20190424193007.06EEA82A24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88a67833098e380d356d65ccd8d97bfdb24cf7f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WolfSSL 4.0.0 has been released, it includes new features and fixes. The
full changelog is available here [1].

Update the wolfssl package to stable version 4.0.0, and the
corresponding hash file.

[1] https://www.wolfssl.com/docs/wolfssl-changelog/

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 1ff9fc61d8..6559486a18 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 70e4fbeb91284a269b25a84fc526755c670475aee4034a6f237b1f754d108af3  v3.15.7-stable.tar.gz
+sha256 6cf678c72b485d1904047c40c20f85104c96b5f39778822783a2c407ccb23657  v4.0.0-stable.tar.gz
 
 # Hash for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 42198cb817..5ef182806a 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 3.15.7
+WOLFSSL_VERSION = 4.0.0
 WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
 WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
 WOLFSSL_INSTALL_STAGING = YES
