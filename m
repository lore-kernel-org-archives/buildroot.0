From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 22:24:25 +0100
Subject: [Buildroot] [git commit] rhash: bump to version 1.3.5
Message-ID: <20180309213409.4A29282885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95e9851b881e91ecd0e4aec59ce393efb6bc062d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add sha256 and license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rhash/rhash.hash | 9 ++++++---
 package/rhash/rhash.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
index 5efc3a67bd..9a29b988a6 100644
--- a/package/rhash/rhash.hash
+++ b/package/rhash/rhash.hash
@@ -1,3 +1,6 @@
-# From https://sourceforge.net/projects/rhash/files/rhash/1.3.4/
-md5 0b51010604659e9e99f6307b053ba13b  rhash-1.3.4-src.tar.gz
-sha1 411d8c7ba84fa9763bc49fa2fd3a7587712fd52c  rhash-1.3.4-src.tar.gz
+# From https://sourceforge.net/projects/rhash/files/rhash/1.3.5/
+md5 f586644019c10c83c6b6835de4b99e74  rhash-1.3.5-src.tar.gz
+sha1 990c9a0135afe48dee4ce1dbf83578e44735f302  rhash-1.3.5-src.tar.gz
+# Locally calculated
+sha256 98e0688acae29e68c298ffbcdbb0f838864105f9b2bd8857980664435b1f1f2e  rhash-1.3.5-src.tar.gz
+sha256 8cf876d3406a2eed6c17ae804c8958bd78d3a0f63c30d6e2e789ab575e9fde40  COPYING
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 53f49d8d3c..28fffe4528 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RHASH_VERSION = 1.3.4
+RHASH_VERSION = 1.3.5
 RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = MIT
