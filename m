From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:35 +0200
Subject: [Buildroot] [PATCH 23/32] package/x11r7/xapp_xlsatoms: bump version
	to 1.1.2, add hash
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-23-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash |    2 ++
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash

diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
new file mode 100644
index 0000000..58d0737
--- /dev/null
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002579.html
+sha256	47e5dc7c3dbda6db2cf8c00cedac1722835c1550aa21cfdbc9ba83906694dea4	xlsatoms-1.1.2.tar.bz2
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index 13c93d5..d6d9338 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSATOMS_VERSION = 1.1.1
+XAPP_XLSATOMS_VERSION = 1.1.2
 XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
 XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSATOMS_LICENSE = MIT
-- 
1.7.10.4
