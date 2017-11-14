From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Nov 2017 14:02:39 +0200
Subject: [Buildroot] [PATCH next v2 2/2] gnupg2: bump to version 2.2.2
In-Reply-To: <4f74cc073562f0ae1d00bdb8b49fb13151a6cf20.1510660959.git.baruch@tkos.co.il>
References: <4f74cc073562f0ae1d00bdb8b49fb13151a6cf20.1510660959.git.baruch@tkos.co.il>
Message-ID: <24021b2b045ed82c59fd83d878b08e2bafcd279f.1510660959.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: bump to 2.2.2
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 84152ee4f2c6..43ce3c632876 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q3/000413.html
-sha1 36ee693d0b2ec529ecf53dd6d397cc38ba71c0a7  gnupg-2.2.0.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q4/000416.html
+sha1 efa00fc20295b1cafe467359107ea170258870e2  gnupg-2.2.2.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.0.tar.bz2.sig
-sha256 d4514a0be0f7a1ff263193330019eb4b53c82f0f5e230af3c14df371271a45e6  gnupg-2.2.0.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.2.tar.bz2.sig
+sha256 bfb62c7412ceb3b9422c6c7134a34ff01a560f98eb981c2d96829c1517c08197  gnupg-2.2.2.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index f5fcb15e369b..baf85e716370 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.0
+GNUPG2_VERSION = 2.2.2
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.15.0
