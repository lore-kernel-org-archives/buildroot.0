From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:32:22 +0200
Subject: [Buildroot] [git commit] package/ccrypt: bump to version 1.11
Message-ID: <20190927212802.80372815BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cc8c68f57b50075376195a0e132839e4a2c078b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ccrypt/ccrypt.hash | 3 ++-
 package/ccrypt/ccrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ccrypt/ccrypt.hash b/package/ccrypt/ccrypt.hash
index a93fcb9afa..4f81c491ed 100644
--- a/package/ccrypt/ccrypt.hash
+++ b/package/ccrypt/ccrypt.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  87d66da2170facabf6f2fc073586ae2c7320d4689980cfca415c74688e499ba0  ccrypt-1.10.tar.gz
+sha256  b19c47500a96ee5fbd820f704c912f6efcc42b638c0a6aa7a4e3dc0a6b51a44f  ccrypt-1.11.tar.gz
+sha256  d48d3af3cf27b32106ee3418c7c892cae745ece26cd909e72aa59b08e3f9c93d  COPYING
diff --git a/package/ccrypt/ccrypt.mk b/package/ccrypt/ccrypt.mk
index 541a0e776d..f8d6328285 100644
--- a/package/ccrypt/ccrypt.mk
+++ b/package/ccrypt/ccrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCRYPT_VERSION = 1.10
+CCRYPT_VERSION = 1.11
 CCRYPT_SITE = http://ccrypt.sourceforge.net/download/$(CCRYPT_VERSION)
 
 CCRYPT_LICENSE = GPL-2.0+
