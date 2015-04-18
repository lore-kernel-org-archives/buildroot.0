From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 21:53:47 +0200
Subject: [Buildroot] [PATCH 02/35] package/x11r7/xcb-util-keysyms: bump
	version to 0.4.0, add hash
In-Reply-To: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429386860-16631-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash |    2 ++
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash

diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
new file mode 100644
index 0000000..a25a263
--- /dev/null
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2014-October/002485.html
+sha256	0ef8490ff1dede52b7de533158547f8b454b241aa3e4dcca369507f66f216dd9	xcb-util-keysyms-0.4.0.tar.bz2
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 6bc0a79..9036b06 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_UTIL_KEYSYMS_VERSION = 0.3.9
+XCB_UTIL_KEYSYMS_VERSION = 0.4.0
 XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.bz2
 XCB_UTIL_KEYSYMS_SITE = http://xcb.freedesktop.org/dist
 
-- 
1.7.10.4
