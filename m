From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 23:33:50 +0100
Subject: [Buildroot] [git commit] nftables: bump to version 0.8.1
Message-ID: <20180128223430.0DC71867FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca0ef6c3c0de2a7e7415c2617d1b44b0cfd75e40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add SHA256 and license hashes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nftables/nftables.hash | 8 ++++++--
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index a743476ae9..d6ccf7b479 100644
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
index 50ffa00129..329b9871fe 100644
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
