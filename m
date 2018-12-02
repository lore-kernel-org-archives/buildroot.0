From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] ipset: bump to version 7.0
Message-ID: <20181202071554.B33AB8A3F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73a78d2fb641b04e49b1ccb029869d950a1af0ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index f41111c022..5885fdbf60 100644
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
index 3ec9448941..98bdcea674 100644
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
