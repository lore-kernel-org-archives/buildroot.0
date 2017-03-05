From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:30:49 +0100
Subject: [Buildroot] [git commit] ipset: bump to version 6.31
Message-ID: <20170305203055.183577FDA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd73c9966dad344bc3958f78877bbb9994407794
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index da860e8..2337c8a 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/ipset/ipset-6.30.tar.bz2.md5sum.txt
-md5	41c32e3b884ec714f0aac95e7675f9d1	ipset-6.30.tar.bz2
+# From http://ftp.netfilter.org/pub/ipset/ipset-6.31.tar.bz2.md5sum.txt
+md5	231790be940438287438df1f33857376	ipset-6.31.tar.bz2
 # Calculated based on the hash above
-sha256	65bfa43fec3d51a6b4012f3d7e4b93a748df9b71b6cd6c53adbec8083e804a31	ipset-6.30.tar.bz2
+sha256	498e411cc1d134201a31a56def6c0936c642958c2d4b4ce7d9955240047a45fe	ipset-6.31.tar.bz2
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 5d7955f..7d16629 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.30
+IPSET_VERSION = 6.31
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
