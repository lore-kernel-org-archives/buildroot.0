From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Apr 2020 11:52:09 +0300
Subject: [Buildroot] [PATCH] package/gnupg2: bump to version 2.2.20
Message-ID: <082b44e28e479f9466666725d29128ccd4858fe0.1586681529.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 2dee44283be8..99100e3179ce 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2019q4/000443.html
-sha1 e24a1208ffe69d7436b2f27e99542a85f34d0ac0  gnupg-2.2.19.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2020q1/000444.html
+sha1 d5290f0781df5dc83302127d6065fb59b35e53d7  gnupg-2.2.20.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.19.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.20.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 242554c0e06f3a83c420b052f750b65ead711cc3fddddb5e7274fcdbb4e9dec0  gnupg-2.2.19.tar.bz2
+sha256 04a7c9d48b74c399168ee8270e548588ddbe52218c337703d7f06373d326ca30  gnupg-2.2.20.tar.bz2
 sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 28e946b4005f..c4a0ec980bd6 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.19
+GNUPG2_VERSION = 2.2.20
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.25.1
