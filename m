From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  5 Mar 2017 21:33:37 +0200
Subject: [Buildroot] [PATCH 2/2] ipset: bump to version 6.31
In-Reply-To: <4dccce88a1f69b1ce62739e89b050382df056626.1488742417.git.baruch@tkos.co.il>
References: <4dccce88a1f69b1ce62739e89b050382df056626.1488742417.git.baruch@tkos.co.il>
Message-ID: <3efa27a6756ef56c806f9b83adbe718829b0fb19.1488742417.git.baruch@tkos.co.il>
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
index da860e8d0562..2337c8a3659b 100644
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
index 5d7955f7ea81..7d16629f7afc 100644
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
-- 
2.11.0
