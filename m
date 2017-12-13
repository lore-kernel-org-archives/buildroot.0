From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 Dec 2017 22:02:14 +0200
Subject: [Buildroot] [PATCH] gnupg2: bump to version 2.2.3
Message-ID: <a81aa96be07d3bd48bf1d8f34b0dcc91a1cd32ba.1513195334.git.baruch@tkos.co.il>
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
index 43ce3c632876..e12f880b09d7 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q4/000416.html
-sha1 efa00fc20295b1cafe467359107ea170258870e2  gnupg-2.2.2.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q4/000417.html
+sha1 68ed37d363166b5bd79971537484148eb8f2958c  gnupg-2.2.3.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.2.tar.bz2.sig
-sha256 bfb62c7412ceb3b9422c6c7134a34ff01a560f98eb981c2d96829c1517c08197  gnupg-2.2.2.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.3.tar.bz2.sig
+sha256 cbd37105d139f7aa74f92b6f65d136658682094b0e308666b820ae4b984084b4  gnupg-2.2.3.tar.bz2
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index baf85e716370..83397e2bbf15 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.2
+GNUPG2_VERSION = 2.2.3
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.15.1
