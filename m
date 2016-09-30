From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Sep 2016 11:55:06 +0200
Subject: [Buildroot] [git commit] nmap: bump version to 7.30
Message-ID: <20160930095716.D1D9782266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0de5da04d4bf3db97cf6845c3ce288f5e48473a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/nmap.hash | 4 ++--
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 448a19b..94e189e 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,2 +1,2 @@
-# From https://nmap.org/dist/sigs/nmap-7.12.tar.bz2.digest.txt
-sha256	63df082a87c95a189865d37304357405160fc6333addcf5b84204c95e0539b04	nmap-7.12.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.30.tar.bz2.digest.txt
+sha256  ba38a042ec67e315d903d28a4976b74999da94c646667c0c63f31e587d6d8d0f nmap-7.30.tar.bz2
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 46c6232..2cc7604 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.12
+NMAP_VERSION = 7.30
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
