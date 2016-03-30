From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Mar 2016 14:44:01 -0300
Subject: [Buildroot] [PATCH] nmap: bump to version 7.12
Message-ID: <1459359841-19644-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nmap/nmap.hash | 4 ++--
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index dde6dab..448a19b 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,2 +1,2 @@
-# From https://nmap.org/dist/sigs/nmap-7.11.tar.bz2.digest.txt
-sha256	13fa971555dec00e495a5b72c1f9efa1363b8e6c7388a2f05117cb0778c0954a	nmap-7.11.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.12.tar.bz2.digest.txt
+sha256	63df082a87c95a189865d37304357405160fc6333addcf5b84204c95e0539b04	nmap-7.12.tar.bz2
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 1829104..46c6232 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.11
+NMAP_VERSION = 7.12
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
-- 
2.7.3
