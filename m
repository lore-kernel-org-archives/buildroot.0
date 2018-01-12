From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 12 Jan 2018 12:39:18 +0200
Subject: [Buildroot] [PATCH 2/2] gnupg2: bump to version 2.2.4
In-Reply-To: <652141f338b9b6c383dd9da7c409e10e5fbb9242.1515753558.git.baruch@tkos.co.il>
References: <652141f338b9b6c383dd9da7c409e10e5fbb9242.1515753558.git.baruch@tkos.co.il>
Message-ID: <40dc82356b1f40dd565c6607543e27fa2b8a94e8.1515753558.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license hash.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnupg2/gnupg2.hash | 9 +++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index e12f880b09d7..a003da668bec 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,6 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q4/000417.html
-sha1 68ed37d363166b5bd79971537484148eb8f2958c  gnupg-2.2.3.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q4/000419.html
+sha1 732266e8888c6f41c084d043c7a0058332ff3580  gnupg-2.2.4.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.3.tar.bz2.sig
-sha256 cbd37105d139f7aa74f92b6f65d136658682094b0e308666b820ae4b984084b4  gnupg-2.2.3.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.4.tar.bz2.sig
+sha256 401a3e64780fdfa6d7670de0880aa5c9d589b3db7a7098979d7606cec546f2ec  gnupg-2.2.4.tar.bz2
+sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 83397e2bbf15..980fae342b7b 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.3
+GNUPG2_VERSION = 2.2.4
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.15.1
