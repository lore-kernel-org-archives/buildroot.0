From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:14 +0100
Subject: [Buildroot] [PATCH 05/14] package/x11r7/xapp_xman: bump version to
	1.1.4, add hash
In-Reply-To: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426418363-22738-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xman/xapp_xman.hash |    3 +++
 package/x11r7/xapp_xman/xapp_xman.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xman/xapp_xman.hash

diff --git a/package/x11r7/xapp_xman/xapp_xman.hash b/package/x11r7/xapp_xman/xapp_xman.hash
new file mode 100644
index 0000000..00a4d85
--- /dev/null
+++ b/package/x11r7/xapp_xman/xapp_xman.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2015-March/002541.html
+sha1	b64516dab2b1c407b28ce3822a98b93178e29f02				xman-1.1.4.tar.bz2
+sha256	b3fa9d2e3f3745c529eb0b6ee4f0e00d936457d11e5221b2efad06ff7c84df29	xman-1.1.4.tar.bz2
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 44f01b1..bca6bbf 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMAN_VERSION = 1.1.3
+XAPP_XMAN_VERSION = 1.1.4
 XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.bz2
 XAPP_XMAN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAN_LICENSE = MIT
-- 
1.7.10.4
