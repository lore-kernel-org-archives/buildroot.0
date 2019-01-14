From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 21:28:14 +0100
Subject: [Buildroot] [git commit] package/iozone: bump to version 3_483
Message-ID: <20190114202858.EC911883DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1cb28a9498078139b099b50580e554dc4e2087f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iozone/iozone.hash | 2 +-
 package/iozone/iozone.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 8f552ba3f3..2a027317fc 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	2733feb63c96f77177c68f3d938f2294d5394d8554b2767c45cbe138b2f3ae30	iozone3_482.tar
+sha256	eeaf16cfbee095b16e4934180c6c7438539629489ce42ef4ace48feb23916b12	iozone3_483.tar
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 05b3973fa0..903d2a1882 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3_482
+IOZONE_VERSION = 3_483
 IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
