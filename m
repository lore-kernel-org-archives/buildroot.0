From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 06:33:11 +0100
Subject: [Buildroot] [git commit] gnupg2: bump to version 2.2.3
Message-ID: <20171214053330.5A87A7F9B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02a07dde425786494d54f5e820abe06b8185a9b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 43ce3c6..e12f880 100644
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
index baf85e7..83397e2 100644
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
