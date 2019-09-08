From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Sep 2019 01:04:32 +0200
Subject: [Buildroot] [git commit] package/nmap: bump to version 7.80
Message-ID: <20190908230020.849F78D591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfa98a7af66893af6c658f8c405b7e4e835577fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the license file changed due to this single change of the
copyright year:

- * The Nmap Security Scanner is (C) 1996-2018 Insecure.Com LLC ("The Nmap  *
+ * The Nmap Security Scanner is (C) 1996-2019 Insecure.Com LLC ("The Nmap  *

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nmap/nmap.hash | 7 ++++---
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 349f98d48b..d7446f1ead 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,4 +1,5 @@
-# From https://nmap.org/dist/sigs/nmap-7.70.tar.bz2.digest.txt
-sha256 847b068955f792f4cc247593aca6dc3dc4aae12976169873247488de147a6e18  nmap-7.70.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.80.tar.bz2.digest.txt (lowercase)
+sha256 fcfa5a0e42099e12e4bf7a68ebe6fde05553383a682e816a7ec9256ab4773faa  nmap-7.80.tar.bz2
+
 # Locally calculated
-sha256 e013006fbdb7a7923e456e72272b115a5d722a3c6a372f27b5e8fcd282104651  COPYING
+sha256 a6afaad36c803dc602734451d9421ed363b48d1ca0faadf0907fc2d91a000284  COPYING
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 761df3ffa8..5da1ce925f 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.70
+NMAP_VERSION = 7.80
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
