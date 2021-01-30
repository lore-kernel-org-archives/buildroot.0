From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 17:02:08 +0100
Subject: [Buildroot] [git commit] package/bitcoin: security bump to version
 0.21.0
Message-ID: <20210130160231.35C6285FBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2050d050bcb493643b54b8460d009e0c76a5480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tag as a security bump as having an up to date bitcoin is important:
https://patchwork.ozlabs.org/project/buildroot/patch/20200202085526.35742-1-james.hilliard1 at gmail.com

https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.21.0.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bitcoin/bitcoin.hash | 4 ++--
 package/bitcoin/bitcoin.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bitcoin/bitcoin.hash b/package/bitcoin/bitcoin.hash
index d39eb38e92..3c65c3d730 100644
--- a/package/bitcoin/bitcoin.hash
+++ b/package/bitcoin/bitcoin.hash
@@ -1,5 +1,5 @@
-# From https://bitcoincore.org/bin/bitcoin-core-0.20.1/SHA256SUMS.asc
-sha256  4bbd62fd6acfa5e9864ebf37a24a04bc2dcfe3e3222f056056288d854c53b978  bitcoin-0.20.1.tar.gz
+# From https://bitcoincore.org/bin/bitcoin-core-0.21.0/SHA256SUMS.asc
+sha256  1a91202c62ee49fb64d57a52b8d6d01cd392fffcbef257b573800f9289655f37  bitcoin-0.21.0.tar.gz
 
 # Hash for license file
 sha256  96fe807030b21f88305adc32af62f9aa19915f2783509fd6f52aea02cf83f644  COPYING
diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index 9d2094c02c..cd127127b6 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITCOIN_VERSION = 0.20.1
+BITCOIN_VERSION = 0.21.0
 BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
