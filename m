From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 Nov 2018 21:52:36 +0200
Subject: [Buildroot] [PATHC next] ipset: bump to version 7.0
Message-ID: <f031ab10ee85ae8884cd2d1c72ff588096cbae02.1542052356.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index f41111c02297..5885fdbf609c 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,6 +1,6 @@
-# From http://ftp.netfilter.org/pub/ipset/ipset-6.38.tar.bz2.md5sum.txt
-md5 0e5d9c85f6b78e7dff0c996e2900574b  ipset-6.38.tar.bz2
+# From http://ipset.netfilter.org/ipset-7.0.tar.bz2.md5sum.txt
+md5 64c4e2e7123481c9db7ee1df127d9531  ipset-7.0.tar.bz2
 # Calculated based on the hash above
-sha256 ceef625ba31fe0aaa422926c7231a819de0b07644c02c17ebdd3022a29e3e244  ipset-6.38.tar.bz2
+sha256 c6fa0f3b7d514e3edd0113ea02f82ab299e5467a4b7733dc31e127cdccc741af  ipset-7.0.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 3ec9448941ec..98bdcea674ae 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.38
+IPSET_VERSION = 7.0
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
2.19.1
