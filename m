From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 11:57:35 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/wolfssl: bump
 version to 4.4.0
Message-ID: <20200829095055.7595E847AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3aba2e0c2ed8a8dadb382cce7e1106bef6c66fa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Also change the hash file to separate the fields by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4b71f00b1e1e7473373036101b5a9242ab1877ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 6 +++---
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 5509552ca4..4a1aeebe7d 100644
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
index 8834a0f468..e3062c39b5 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 4.3.0-stable
+WOLFSSL_VERSION = 4.4.0-stable
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION))
 WOLFSSL_INSTALL_STAGING = YES
 
