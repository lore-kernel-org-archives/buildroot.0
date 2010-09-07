From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Sep 2010 23:08:40 +0200
Subject: [Buildroot] [git commit master 1/1] kismet: bump to  2010-07-R1
Message-ID: <20100907211001.398ED8A4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ee314c97f9321eda8776d17a02ce445691eda50c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/kismet/kismet.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9e3b2eb..0350a0e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 	Kconfig infrastructure rebased against 2.6.36-rc1, bringing
 	misc fixes + nconfig and savedefconfig targets.
 
-	Updated/fixed packages: busybox, dropbear, openvpn
+	Updated/fixed packages: busybox, dropbear, kismet, openvpn
 
 2010.08: Released August 31th, 2010:
 
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 6135c88..de66ee6 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-KISMET_VERSION = 2010-01-R1
+KISMET_VERSION = 2010-07-R1
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = libpcap ncurses
 
-- 
1.7.1
