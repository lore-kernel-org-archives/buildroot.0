From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:29:34 +0200
Subject: [Buildroot] [PATCH 06/61] package/x11r7/xapp_xinput: bump version
	to 1.6.1, add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xinput/xapp_xinput.hash |    2 ++
 package/x11r7/xapp_xinput/xapp_xinput.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xinput/xapp_xinput.hash

diff --git a/package/x11r7/xapp_xinput/xapp_xinput.hash b/package/x11r7/xapp_xinput/xapp_xinput.hash
new file mode 100644
index 0000000..a8f6b70
--- /dev/null
+++ b/package/x11r7/xapp_xinput/xapp_xinput.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-September/002321.html
+sha256	b7632d0f228a8a6be93b09857ea413940fcf44091e60f4a0fe9f5fd82efd871f	xinput-1.6.1.tar.bz2
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 790f2c0..099408b 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINPUT_VERSION = 1.6.0
+XAPP_XINPUT_VERSION = 1.6.1
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINPUT_LICENSE = MIT
-- 
1.7.10.4
