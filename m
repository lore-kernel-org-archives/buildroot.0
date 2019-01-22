From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 21:48:43 +0100
Subject: [Buildroot] [git commit] package/ipset: bump to version 7.1
Message-ID: <20190122204938.ABC018E290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec10f95e445eb92449a39c4baf31f6471c7bfecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 5885fdbf60..46e285b1ea 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,6 +1,6 @@
-# From http://ipset.netfilter.org/ipset-7.0.tar.bz2.md5sum.txt
-md5 64c4e2e7123481c9db7ee1df127d9531  ipset-7.0.tar.bz2
+# From http://ipset.netfilter.org/ipset-7.1.tar.bz2.md5sum.txt
+md5 72b477d1ce076d681b0799f88280f2f3  ipset-7.1.tar.bz2
 # Calculated based on the hash above
-sha256 c6fa0f3b7d514e3edd0113ea02f82ab299e5467a4b7733dc31e127cdccc741af  ipset-7.0.tar.bz2
+sha256 7b5eb3b93205c20cdc39e3fc8b6e5f7bb214bf79a7c0c00729dd4a31ce16adc4  ipset-7.1.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 98bdcea674..542afc963b 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.0
+IPSET_VERSION = 7.1
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
