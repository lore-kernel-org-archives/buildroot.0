From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 22 Apr 2017 19:38:37 +0200
Subject: [Buildroot] [Patch v5 4/7] rustc: expose host variant in menuconfig
In-Reply-To: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
References: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170422173840.19694-5-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that one provider is available for rustc, expose the host variant in
menuconfig.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 38f919a..49fcdb0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -39,6 +39,7 @@ menu "Host utilities"
 	source "package/python-lxml/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
+	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
-- 
2.9.3
