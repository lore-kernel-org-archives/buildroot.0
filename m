From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:33 +0200
Subject: [Buildroot] [PATCH 21/32] package/x11r7/xapp_xkbedv: bump version
	to 1.1.4, add hash
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-21-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xkbevd/xapp_xkbevd.hash |    2 ++
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xkbevd/xapp_xkbevd.hash

diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
new file mode 100644
index 0000000..b350d29
--- /dev/null
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002577.html
+sha256	2430a2e5302a4cb4a5530c1df8cb3721a149bbf8eb377a2898921a145197f96a	xkbevd-1.1.4.tar.bz2
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index eb8a387..7a9a8fb 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBEVD_VERSION = 1.1.3
+XAPP_XKBEVD_VERSION = 1.1.4
 XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
 XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBEVD_LICENSE = MIT
-- 
1.7.10.4
