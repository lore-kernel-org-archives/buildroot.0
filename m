From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 14:44:08 +0200
Subject: [Buildroot] [git commit] ipset: bump to version 6.30
Message-ID: <20161028124448.BCD677FCA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe41acfd6721e6250a6a1defc67f78fd0d603fb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 844bebb..da860e8 100644
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
index fff67e2..db4952b 100644
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
