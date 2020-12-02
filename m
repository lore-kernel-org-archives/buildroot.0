From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  2 Dec 2020 21:24:23 +0100
Subject: [Buildroot] [PATCH/next v1] package/nmap: bump version to 7.91
Message-ID: <20201202202423.483-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/nmap/nmap.hash | 6 +++---
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index d7446f1ead..5c684ecabe 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,5 +1,5 @@
-# From https://nmap.org/dist/sigs/nmap-7.80.tar.bz2.digest.txt (lowercase)
-sha256 fcfa5a0e42099e12e4bf7a68ebe6fde05553383a682e816a7ec9256ab4773faa  nmap-7.80.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.91.tar.bz2.digest.txt (lowercase)
+sha256  18cc4b5070511c51eb243cdd2b0b30ff9b2c4dc4544c6312f75ce3a67a593300  nmap-7.91.tar.bz2
 
 # Locally calculated
-sha256 a6afaad36c803dc602734451d9421ed363b48d1ca0faadf0907fc2d91a000284  COPYING
+sha256  a6afaad36c803dc602734451d9421ed363b48d1ca0faadf0907fc2d91a000284  COPYING
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 5da1ce925f..a719b268c8 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.80
+NMAP_VERSION = 7.91
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.29.2
