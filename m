From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 12:30:58 +0200
Subject: [Buildroot] [git commit] package/ipset: bump to version 7.11
Message-ID: <20210404101725.0FCF38103E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=590dc115d39d29c102a52e56a1f8a4ee64723719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

http://git.netfilter.org/ipset/tree/ChangeLog?h=v7.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipset/ipset.hash | 8 +++-----
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index fb200585d1..afe83f6dce 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,6 +1,4 @@
-# From http://ipset.netfilter.org/ipset-7.6.tar.bz2.md5sum.txt
-md5 e107b679c3256af795261cece864d6d9  ipset-7.6.tar.bz2
-# Calculated based on the hash above
-sha256 0e7d44caa9c153d96a9b5f12644fbe35a632537a5a7f653792b72e53d9d5c2db  ipset-7.6.tar.bz2
+# From https://ipset.netfilter.org/ipset-7.11.tar.bz2.sha512sum.txt
+sha512  20890de32c17c04d9d3ae42fff64acfe21a252974bee5843ae39bdda707fcef55fde11cffccab9f987bf7e18f5445443c46c50eb854fb6f93f172f7bad07f922  ipset-7.11.tar.bz2
 # Locally calculated
-sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 4c5a44a56a..07f865d4ec 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.6
+IPSET_VERSION = 7.11
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
