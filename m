From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Oct 2016 07:51:48 +0300
Subject: [Buildroot] [PATCH] ipset: bump to version 6.30
Message-ID: <5bad5b335c9996465da802d8ef6cf63ed43ffab3.1477630308.git.baruch@tkos.co.il>
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
index 844bebba8c57..da860e8d0562 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,4 +1,4 @@
-# From ftp://ftp.netfilter.org/pub/ipset/ipset-6.27.tar.bz2.md5sum.txt
-md5	c39f8958908b1396e2c69f082b75d924	ipset-6.27.tar.bz2
+# From ftp://ftp.netfilter.org/pub/ipset/ipset-6.30.tar.bz2.md5sum.txt
+md5	41c32e3b884ec714f0aac95e7675f9d1	ipset-6.30.tar.bz2
 # Calculated based on the hash above
-sha256	724897a80395534466142c3542184e5a480a5046140ca2a7d9097690b931b235	ipset-6.27.tar.bz2
+sha256	65bfa43fec3d51a6b4012f3d7e4b93a748df9b71b6cd6c53adbec8083e804a31	ipset-6.30.tar.bz2
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index fff67e274601..db4952b1d564 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 6.27
+IPSET_VERSION = 6.30
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-- 
2.9.3
