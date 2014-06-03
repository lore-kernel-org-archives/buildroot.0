From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Jun 2014 08:51:55 +0200
Subject: [Buildroot] [PATCH] tvheadend: fix license file variable after
	version bump
Message-ID: <1401778315-20973-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/a8a/a8a5a17faa069abdde7cfc58da327c292874069f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 244e129..f0bb834 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -7,7 +7,7 @@
 TVHEADEND_VERSION = 0ebca1b3dbb6a18d8adcf66a32b5922ce769b9b5
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
-TVHEADEND_LICENSE_FILES = LICENSE
+TVHEADEND_LICENSE_FILES = LICENSE.md
 TVHEADEND_DEPENDENCIES = host-pkgconf host-python openssl
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
-- 
1.9.3
