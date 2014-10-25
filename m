From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:25:59 +0200
Subject: [Buildroot] [git commit] package/hwdata: bump to 0.267,
	move download URL to snapshot.debian.org
Message-ID: <20141025095905.6675FB13C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce95a8ece966d5f74269305daee672e3a48e33b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hwdata/hwdata.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index a830263..f8cffcd 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.230
+HWDATA_VERSION = 0.267
 HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
 HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
-HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata
+HWDATA_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/hwdata
 HWDATA_LICENSE = GPLv2+ or XFree86 1.0 license
 HWDATA_LICENSE_FILES = COPYING LICENSE
 
