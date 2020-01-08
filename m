From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:33:44 +0100
Subject: [Buildroot] [git commit] package/bustle: bump to version 0.7.5
Message-ID: <20200108082412.E1AC181944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e70fdbbaea2345bdc8da41f26d1712b5a75a2cf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch homepage to https://gitlab.freedesktop.org/bustle/bustle/
- Switch site to
  https://www.freedesktop.org/software/bustle/$(BUSTLE_VERSION)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bustle/Config.in   | 2 +-
 package/bustle/bustle.hash | 3 ++-
 package/bustle/bustle.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/bustle/Config.in b/package/bustle/Config.in
index 109ebdeed8..c9d38d0d31 100644
--- a/package/bustle/Config.in
+++ b/package/bustle/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_BUSTLE
 	  This only installs the command line bustle-pcap tool, not
 	  the graphical viewer.
 
-	  http://www.willthompson.co.uk/bustle/
+	  https://gitlab.freedesktop.org/bustle/bustle/
 
 comment "bustle needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/bustle/bustle.hash b/package/bustle/bustle.hash
index 49890f74ff..05281c4f11 100644
--- a/package/bustle/bustle.hash
+++ b/package/bustle/bustle.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 921c2cbbb957dcb02c3aa8fd1eeff3534cb437fa9eeca1c25206ad1e741a3f14  bustle-0.5.4.tar.gz
+sha256 7760a695b25cb264e7342f353dcdc6d2b7faeacdcd85dd14e03c61b18e791664  bustle-0.7.5.tar.gz
+sha256 a6d6109e5b086de8e852e451b91b08b323302f55b6975d506c64c43bb094be38  LICENSE
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index ffbfbe40f7..675ffb0529 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BUSTLE_VERSION = 0.5.4
-BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)
+BUSTLE_VERSION = 0.7.5
+BUSTLE_SITE = https://www.freedesktop.org/software/bustle/$(BUSTLE_VERSION)
 BUSTLE_LICENSE = LGPL-2.1+
 BUSTLE_LICENSE_FILES = LICENSE
 BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
