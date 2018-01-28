From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 28 Jan 2018 21:42:47 +0200
Subject: [Buildroot] [PATCH 2/2] nftables: bump to version 0.8.1
In-Reply-To: <01c6442f97f7c856822ab7c26a24182a0d731d9e.1517168567.git.baruch@tkos.co.il>
References: <01c6442f97f7c856822ab7c26a24182a0d731d9e.1517168567.git.baruch@tkos.co.il>
Message-ID: <89edb974537829f1bf223bc6e82a098f3a9a2812.1517168567.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add SHA256 and license hashes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nftables/nftables.hash | 8 ++++++--
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index a743476ae91c..d6ccf7b479a8 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,2 +1,6 @@
-# From http://www.netfilter.org/projects/nftables/downloads.html#nftables-0.7
-sha1	c003fa8b63b1b44c52de345a4d84487d81865a98	nftables-0.7.tar.bz2
+# From http://www.netfilter.org/projects/nftables/downloads.html
+sha1	51fd436845718f1221ee198128656ef9055c2588	nftables-0.8.1.tar.bz2
+# Locally calculated after checking pgp signature
+# http://www.netfilter.org/projects/nftables/files/nftables-0.8.1.tar.bz2.sig
+sha256	8aead66cce70d68c70e4be917813abcbcf62811ee6de4c7761d0e34391772fc4	nftables-0.8.1.tar.bz2
+sha256	c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e	COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 50ffa0012951..329b9871feab 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.7
+NFTABLES_VERSION = 0.8.1
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = http://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = gmp libmnl libnftnl host-bison host-flex \
-- 
2.15.1
