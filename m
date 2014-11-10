From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2014 20:50:25 +0100
Subject: [Buildroot] [PATCH 2/3] configs/apf9328: use default gcc version
In-Reply-To: <1415649026-30847-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1415649026-30847-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1415649026-30847-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gcc 4.4 version has been deprecated recently, so we cannot use it
anymore. Since this platform is just using a normal ARM processor with
nothing special, we can expect the default gcc version to just work.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/armadeus_apf9328_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index 806e9a8..048bd28 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -3,7 +3,6 @@ BR2_arm=y
 BR2_arm920t=y
 
 # Toolchain
-BR2_GCC_VERSION_4_4_X=y
 BR2_PACKAGE_GDB=y
 BR2_PACKAGE_HOST_GDB=y
 BR2_ENABLE_LOCALE_PURGE=y
-- 
2.0.0
