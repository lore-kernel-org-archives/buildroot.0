From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Apr 2015 09:17:37 -0300
Subject: [Buildroot] [PATCH 09/14] system: drop IPv6 depend for systemd
In-Reply-To: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428754662-27829-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's no longer an option so it must be dropped.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 431524d..84cde94 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -81,7 +81,6 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_WCHAR
-	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
-- 
2.0.5
