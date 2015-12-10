From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 10 Dec 2015 16:01:22 +0000
Subject: [Buildroot] [PATCH] nmap: bump version to 7.01
Message-ID: <1449763282-41650-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/nmap/nmap.hash | 2 +-
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index c7b3cf5..3e5a369 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 9f442301c615c608a385831c3505cdfed9b0795cd100f1a258b04509802802ae  nmap-7.00.tar.bz2
+sha256 cf1fcd2643ba2ef52f47acb3c18e52fa12a4ae4b722804da0e54560704627705  nmap-7.01.tar.bz2
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index c4fbe72..184555b 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.00
+NMAP_VERSION = 7.01
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
-- 
2.4.10
