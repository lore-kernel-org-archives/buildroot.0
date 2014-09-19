From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 23:14:55 +0200
Subject: [Buildroot] [PATCH 05/14] package/linux-firmware: use the new bnx2x
	firmware version
In-Reply-To: <cover.1411161197.git.yann.morin.1998@free.fr>
References: <cover.1411161197.git.yann.morin.1998@free.fr>
Message-ID: <c662bd5a7005688605c38f2729fb10882bc23b10.1411161197.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0f3b150..f2c2e3a 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -172,9 +172,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += \
-	bnx2x/bnx2x-e1-7.8.17.0.fw \
-	bnx2x/bnx2x-e1h-7.8.17.0.fw \
-	bnx2x/bnx2x-e2-7.8.17.0.fw
+	bnx2x/bnx2x-e1-7.10.51.0.fw \
+	bnx2x/bnx2x-e1h-7.10.51.0.fw \
+	bnx2x/bnx2x-e2-7.10.51.0.fw
 # No license file; the license is in the file WHENCE
 # which is installed unconditionally
 endif
-- 
1.9.1
