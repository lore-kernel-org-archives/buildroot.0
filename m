From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 23 Sep 2019 21:01:09 +0200
Subject: [Buildroot] [PATCH] package/cryptodev-linux: bump to version a1e738a
Message-ID: <1569265269-12741-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This includes the following changes:

a1e738a tests: cipher-aead-srtp: Fix cao->dst alignment
f971e0c Fix module loading with Linux v5.0-rc5
fd8b15e Release version 1.10
6b0a81c add CIOCCPHASH to copy hash state between sessions

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/cryptodev-linux/cryptodev-linux.hash | 2 +-
 package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index eeb481d..4319fd3 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 994ed2f715dd3786f534d5215ae7ae4735b84cff28ea41080ff3501bf1503944 cryptodev-linux-f60aa08c63fc02780554a0a12180a478ca27d49f.tar.gz
+sha256 50cf34ecedc897edb11d1a24076f0d4cfcb704dcd294273bc03e2f6c3632fe2c cryptodev-linux-a1e738aef6249ee3bddf997e91e59b1210553209.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 028f7b1..a02add6 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = f60aa08c63fc02780554a0a12180a478ca27d49f
+CRYPTODEV_LINUX_VERSION = a1e738aef6249ee3bddf997e91e59b1210553209
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
-- 
2.7.4
