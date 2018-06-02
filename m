From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jun 2018 12:43:54 +0200
Subject: [Buildroot] [git commit] ipset: bump to version 6.38
Message-ID: <20180602104305.1A47183463@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcebf84c9ea430c75f52c28ef75e3f03b56dac17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 9185d94d85..f41111c022 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,6 +1,6 @@
-# From http://ftp.netfilter.org/pub/ipset/ipset-6.36.tar.bz2.md5sum.txt
-md5 fda041afefd581464e445b87beeb0681  ipset-6.36.tar.bz2
+# From http://ftp.netfilter.org/pub/ipset/ipset-6.38.tar.bz2.md5sum.txt
+md5 0e5d9c85f6b78e7dff0c996e2900574b  ipset-6.38.tar.bz2
 # Calculated based on the hash above
-sha256 22224a90dc6c7d97b7a7addedd0740c3841e3d9a7ff8c8d2123bae0c3620d30d  ipset-6.36.tar.bz2
+sha256 ceef625ba31fe0aaa422926c7231a819de0b07644c02c17ebdd3022a29e3e244  ipset-6.38.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index e9f8165fab..3ec9448941 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.36
+IPSET_VERSION = 6.38
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
