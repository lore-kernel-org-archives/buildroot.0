From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  4 May 2018 08:01:42 +0300
Subject: [Buildroot] [PATCH 3/3] gnupg2: bump to version 2.2.7
In-Reply-To: <2659cc021a076d8ed583a0bf432ffbfa75f2655b.1525410102.git.baruch@tkos.co.il>
References: <2659cc021a076d8ed583a0bf432ffbfa75f2655b.1525410102.git.baruch@tkos.co.il>
Message-ID: <af96d51f65548572e20ae737bd83cd8666e4ef53.1525410102.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 155295244e6c..f5cc95cb1b4c 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,6 +1,6 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000421.html
-sha1 295298debcc2c12f02a2f2fdf04aecb6d6aae396  gnupg-2.2.6.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000424.html
+sha1 e222cda63409a86992369df8976f6c7511e10ea0  gnupg-2.2.7.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.6.tar.bz2.sig
-sha256 e64d8c5fa2d05938a5080cb784a98ac21be0812f2a26f844b18f0d6a0e711984  gnupg-2.2.6.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.7.tar.bz2.sig
+sha256 d95b361ee6ef7eff86af40c8c72bf9313736ac9f7010d6604d78bf83818e976e  gnupg-2.2.7.tar.bz2
 sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 4d84bfbb9ea8..0823921b0b14 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.6
+GNUPG2_VERSION = 2.2.7
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.17.0
