From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 19:40:18 +0100
Subject: [Buildroot] [PATCH 4/5] package/linux-firmware: bump
In-Reply-To: <cover.1390070341.git.yann.morin.1998@free.fr>
References: <cover.1390070341.git.yann.morin.1998@free.fr>
Message-ID: <cc9e9e89c61ed2024837f71325bf96c0852b3a4c.1390070341.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index de5213f..bd37f67 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 76b366df2afdde9811fdd5fc128d1779e26e7be7
+LINUX_FIRMWARE_VERSION = 52d77db9f133afe4d2b26aeccfd603745f45fda1
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
1.8.1.2
