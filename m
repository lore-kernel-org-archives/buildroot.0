From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Oct 2016 14:56:09 +0200
Subject: [Buildroot] [git commit] nmap: bump version to 7.31
Message-ID: <20161022125828.442378188A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=342ef8e3ca81dba8d6ea9515b9f4c74df720bedf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/nmap.hash | 4 ++--
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 94e189e..2a26557 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,2 +1,2 @@
-# From https://nmap.org/dist/sigs/nmap-7.30.tar.bz2.digest.txt
-sha256  ba38a042ec67e315d903d28a4976b74999da94c646667c0c63f31e587d6d8d0f nmap-7.30.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.31.tar.bz2.digest.txt
+sha256 cb9f4e03c0771c709cd47dc8fc6ac3421eadbdd313f0aae52276829290583842  nmap-7.31.tar.bz2
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 2cc7604..3087903 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.30
+NMAP_VERSION = 7.31
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
