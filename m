From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 21:53:08 +0100
Subject: [Buildroot] [git commit] nmap: bump to version 7.10
Message-ID: <20160318205619.7C22781D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=500574d9d89dbe6a847f31cedb0c99ee8811858d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmap/nmap.hash | 4 ++--
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 3e5a369..ac086ce 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256 cf1fcd2643ba2ef52f47acb3c18e52fa12a4ae4b722804da0e54560704627705  nmap-7.01.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.10.tar.bz2.digest.txt
+sha256	58cf8896d09057d1c3533f430c06b22791d0227ebbb93dede2ccb73693ed4b4b	nmap-7.10.tar.bz2
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 184555b..9a25fca 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.01
+NMAP_VERSION = 7.10
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
