From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 22:35:13 +0200
Subject: [Buildroot] [git commit] hwdata: add license information
Message-ID: <20140525204125.CCEB79CD68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9824b3631a183c3594fda8c021e334b51b7c0c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing license info and file for package 'hwdata'

[Peter: GPLv2 should be '+' variant, clarify that it is dual licensed]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hwdata/hwdata.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 501baec..9d976d1 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -8,6 +8,8 @@ HWDATA_VERSION = 0.230
 HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
 HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
 HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
+HWDATA_LICENSE = GPLv2+ or XFree86 1.0 license
+HWDATA_LICENSE_FILES = COPYING LICENSE
 
 define HWDATA_INSTALL_TARGET_CMDS
 	install -D -m 644 $(@D)/pci.ids $(TARGET_DIR)/usr/share/hwdata/pci.ids
