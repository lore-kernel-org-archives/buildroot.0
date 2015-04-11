From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Apr 2015 09:17:35 -0300
Subject: [Buildroot] [PATCH 07/14] configs: drop redundant IPv6 option
In-Reply-To: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428754662-27829-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the buildroot toolchain IPv6 option from the only config that's got
it since it's now a non-option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/armadeus_apf9328_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index 3ad8feb..d6388db 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -6,7 +6,6 @@ BR2_arm920t=y
 BR2_PACKAGE_GDB=y
 BR2_PACKAGE_HOST_GDB=y
 BR2_ENABLE_LOCALE_PURGE=y
-BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
 BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-- 
2.0.5
