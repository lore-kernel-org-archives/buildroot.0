From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 3 Jul 2019 23:56:08 +0200
Subject: [Buildroot] [git commit] package/ipset: bump to version 7.2
Message-ID: <20190703215603.B35C78270C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=946901317cc6442886e789c173c781e40f319e2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ipset/ipset.hash | 6 +++---
 package/ipset/ipset.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ipset/ipset.hash b/package/ipset/ipset.hash
index 46e285b1ea..7405accd1a 100644
--- a/package/ipset/ipset.hash
+++ b/package/ipset/ipset.hash
@@ -1,6 +1,6 @@
-# From http://ipset.netfilter.org/ipset-7.1.tar.bz2.md5sum.txt
-md5 72b477d1ce076d681b0799f88280f2f3  ipset-7.1.tar.bz2
+# From http://ipset.netfilter.org/ipset-7.2.tar.bz2.md5sum.txt
+md5 9eef4a237f9ccec48744836ee1497dba  ipset-7.2.tar.bz2
 # Calculated based on the hash above
-sha256 7b5eb3b93205c20cdc39e3fc8b6e5f7bb214bf79a7c0c00729dd4a31ce16adc4  ipset-7.1.tar.bz2
+sha256 2e13384534669edc85ca6ab418c59429d5296132c5c27c44479d4c0a59434618  ipset-7.2.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 542afc963b..b8ba932d29 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPSET_VERSION = 7.1
+IPSET_VERSION = 7.2
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
