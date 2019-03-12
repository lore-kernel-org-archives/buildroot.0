From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Mar 2019 20:48:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/gnupg2: bump to version 2.2.13
In-Reply-To: <75e9564144a18c8b6b7a8a2527ac5a41719a8a10.1552416535.git.baruch@tkos.co.il>
References: <75e9564144a18c8b6b7a8a2527ac5a41719a8a10.1552416535.git.baruch@tkos.co.il>
Message-ID: <69d011815b815681eb495d88ecea23e7b831cbc6.1552416535.git.baruch@tkos.co.il>
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
index f985e11ad3c3..a9b7d10f6780 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q4/000433.html
-sha1 2aeccc35ea8034306ff7a1072b84abbaa79619c3  gnupg-2.2.12.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2019q1/000434.html
+sha1 66ebc053e2d22f743673d3fbe54453774e4fac58  gnupg-2.2.13.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.12.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.13.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 db030f8b4c98640e91300d36d516f1f4f8fe09514a94ea9fc7411ee1a34082cb  gnupg-2.2.12.tar.bz2
+sha256 76c787a955f9e6e0ead47c9be700bfb9d454f955a7b7c7e697aa719bac7b11d8  gnupg-2.2.13.tar.bz2
 sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 9365e960f258..ca6b6293e770 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.12
+GNUPG2_VERSION = 2.2.13
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.20.1
