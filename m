From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 Sep 2017 22:43:34 +0300
Subject: [Buildroot] [PATCH 2/2] gnupg2: bump to version 2.2.1
In-Reply-To: <1c0d8419ba2320d55a8522f022ec76db9d813529.1506627814.git.baruch@tkos.co.il>
References: <1c0d8419ba2320d55a8522f022ec76db9d813529.1506627814.git.baruch@tkos.co.il>
Message-ID: <a5d237b1157ab6136eeccb0d143ee2f60dc0fd33.1506627814.git.baruch@tkos.co.il>
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
index 84152ee4f2c6..77058f63ed14 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html
-sha1 36ee693d0b2ec529ecf53dd6d397cc38ba71c0a7  gnupg-2.2.0.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000415.html
+sha1 5455373fd7208b787f319027de2464721cdd4413  gnupg-2.2.1.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.0.tar.bz2.sig
-sha256 d4514a0be0f7a1ff263193330019eb4b53c82f0f5e230af3c14df371271a45e6  gnupg-2.2.0.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.1.tar.bz2.sig
+sha256 34d70cd65b9c95f3f2f90a9f5c1e0b6a0fe039a8d685e2d66d69c33d1cbf62fb  gnupg-2.2.1.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index f5fcb15e369b..39bdee035e90 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.0
+GNUPG2_VERSION = 2.2.1
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.14.2
