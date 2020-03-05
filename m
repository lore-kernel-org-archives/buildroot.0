From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 21:06:47 +0100
Subject: [Buildroot] [git commit] package/ipset: bump to version 7.6
Message-ID: <20200309140908.EE3AE7FB4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7df15b5c1e12a8ca96329d1ce1cf0713cd1b0c56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See full changelog http://ipset.netfilter.org/changelog.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 9c95ca420f..fb200585d1 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,6 +1,6 @@
-# From http://ipset.netfilter.org/ipset-7.5.tar.bz2.md5sum.txt
-md5 1f3156c68f6fa6de03d8f3ca0539fb78  ipset-7.5.tar.bz2
+# From http://ipset.netfilter.org/ipset-7.6.tar.bz2.md5sum.txt
+md5 e107b679c3256af795261cece864d6d9  ipset-7.6.tar.bz2
 # Calculated based on the hash above
-sha256 a57aee54ab6ffe9e04603a464bbf69d66db976500bb04dd04fd3fbd6efb36a0b  ipset-7.5.tar.bz2
+sha256 0e7d44caa9c153d96a9b5f12644fbe35a632537a5a7f653792b72e53d9d5c2db  ipset-7.6.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 383e90af38..869763d322 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.5
+IPSET_VERSION = 7.6
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
