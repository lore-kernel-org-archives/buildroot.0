From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:31 +0200
Subject: [Buildroot] [PATCH 05/11] package/hwdata: bump to 0.267,
	move download URL to snapshot.debian.org
In-Reply-To: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
References: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
Message-ID: <1414075717-7333-6-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/hwdata/hwdata.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
 
-- 
1.7.10.4
