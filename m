From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:04 +0200
Subject: [Buildroot] [PATCH 53/83 v2] package/linux-firmware: use
	'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <536bc6c286e921acb7ea869a8d942037935fbaa0.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linux-firmware has more than 5 options, so use a 'menuconfig' to group
the options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f56f31d..537273f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LINUX_FIRMWARE
+menuconfig BR2_PACKAGE_LINUX_FIRMWARE
 	bool "linux-firmware"
 	help
 	  This package provides various binary firmware files (closed
-- 
2.7.4
