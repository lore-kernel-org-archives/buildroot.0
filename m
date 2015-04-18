From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:29:30 +0200
Subject: [Buildroot] [PATCH 02/61] package/x11r7/xapp_xdbedizzy: bump
	version to 1.1.0, add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash |    2 ++
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash

diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash
new file mode 100644
index 0000000..8fbe8b0
--- /dev/null
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2010-October/001514.html
+sha1	281bee72116311e2d8393ae53ea832e9d267eded	xdbedizzy-1.1.0.tar.bz2
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
index e732dc4..72d04f8 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDBEDIZZY_VERSION = 1.0.2
+XAPP_XDBEDIZZY_VERSION = 1.1.0
 XAPP_XDBEDIZZY_SOURCE = xdbedizzy-$(XAPP_XDBEDIZZY_VERSION).tar.bz2
 XAPP_XDBEDIZZY_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDBEDIZZY_LICENSE = MIT
-- 
1.7.10.4
