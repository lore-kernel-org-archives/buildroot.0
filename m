From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 13:22:54 +1100
Subject: [Buildroot] [git commit] linux-firmware: install rtl8168h firmware
Message-ID: <20170120022300.7017381E4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ae4f64321e421db84b24a30b784754e3fee421c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
