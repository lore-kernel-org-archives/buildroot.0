From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:32:31 +0100
Subject: [Buildroot] [git commit] nmap: bump to version 7.11
Message-ID: <20160324213322.4A4DC819ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3bbd97126bb5aa47f43c80cc723e8cda1e833d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nmap/nmap.hash | 4 ++--
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index ac086ce..dde6dab 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,2 +1,2 @@
-# From https://nmap.org/dist/sigs/nmap-7.10.tar.bz2.digest.txt
-sha256	58cf8896d09057d1c3533f430c06b22791d0227ebbb93dede2ccb73693ed4b4b	nmap-7.10.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.11.tar.bz2.digest.txt
+sha256	13fa971555dec00e495a5b72c1f9efa1363b8e6c7388a2f05117cb0778c0954a	nmap-7.11.tar.bz2
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 9a25fca..1829104 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.10
+NMAP_VERSION = 7.11
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
