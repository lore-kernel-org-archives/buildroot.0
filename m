From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 15:13:21 +0100
Subject: [Buildroot] [git commit] nmap: bump to version 7.40
Message-ID: <20161221141352.21B6A7FB27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=961132a393dd6feb8820dc08ef6223808b39a780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/nmap.hash | 4 ++--
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 2a26557..239ca13 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,2 +1,2 @@
-# From https://nmap.org/dist/sigs/nmap-7.31.tar.bz2.digest.txt
-sha256 cb9f4e03c0771c709cd47dc8fc6ac3421eadbdd313f0aae52276829290583842  nmap-7.31.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.40.tar.bz2.digest.txt
+sha256 9e14665fffd054554d129d62c13ad95a7b5c7a046daa2290501909e65f4d3188  nmap-7.40.tar.bz2
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 3087903..6e178b1 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.31
+NMAP_VERSION = 7.40
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
