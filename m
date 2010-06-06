From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jun 2010 20:36:09 +0200
Subject: [Buildroot] [git commit master] libusb: bump version
Message-ID: <20100606183654.EE40A8B888@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3638e528e0e308d18e62f03c57aeb01079c12956
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1897

[Peter: bump to 1.08 instead]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    3 ++-
 package/libusb/libusb.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index a49afc5..eaac40d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, libidn, netperf, qt
+	Updated/fixed packages: cdrkit, libidn, netperf, qt, usbutils
 
 	Removed packages: modutils
 
@@ -16,6 +16,7 @@
 	#1771: Fakeroot and the target/generic/device_table.txt create bad...
 	#1879: Bump iptables to 1.4.8
 	#1885: Add a bunch of lua modules
+	#1897: Bump libusb to 1.0.7
 	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
 
 2010.05, Released May 30th, 2010:
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 8977d52..141633b 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -3,7 +3,7 @@
 # libusb
 #
 #############################################################
-LIBUSB_VERSION = 1.0.3
+LIBUSB_VERSION = 1.0.8
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
 LIBUSB_LIBTOOL_PATCH = NO
-- 
1.6.3.3
