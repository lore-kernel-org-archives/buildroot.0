From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 19 Jan 2017 16:13:23 -0500
Subject: [Buildroot] [PATCH 2/2] linux-firmware: install rtl8168h firmware
In-Reply-To: <1484860403-1167-1-git-send-email-fhunleth@troodon-software.com>
References: <1484860403-1167-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1484860403-1167-2-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/linux-firmware/linux-firmware.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b34db46..51e07b5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -331,6 +331,8 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8168f-2.fw \
 	rtl_nic/rtl8168g-2.fw \
 	rtl_nic/rtl8168g-3.fw \
+	rtl_nic/rtl8168h-1.fw \
+	rtl_nic/rtl8168h-2.fw \
 	rtl_nic/rtl8402-1.fw \
 	rtl_nic/rtl8411-1.fw \
 	rtl_nic/rtl8411-2.fw
-- 
2.7.4
