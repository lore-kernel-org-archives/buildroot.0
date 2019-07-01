From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 Jul 2019 15:12:56 +0300
Subject: [Buildroot] [PATCH 3/3] package/ipset: bump to version 7.2
In-Reply-To: <838be080c94bce93e5da8a5a4266be7a2a92be20.1561983176.git.baruch@tkos.co.il>
References: <838be080c94bce93e5da8a5a4266be7a2a92be20.1561983176.git.baruch@tkos.co.il>
Message-ID: <ddfee74e828ed7bff73470321ad6799194b43ed1.1561983176.git.baruch@tkos.co.il>
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
index 46e285b1ea8c..7405accd1a94 100644
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
index 542afc963bcb..b8ba932d2970 100644
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
-- 
2.20.1
