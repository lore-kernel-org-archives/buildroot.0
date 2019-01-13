From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Jan 2019 13:37:45 +0100
Subject: [Buildroot] [PATCH 1/7] fdk-aac: enable for aarch64
In-Reply-To: <1547383071-11783-1-git-send-email-gilles.talis@gmail.com>
References: <1547383071-11783-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1547383071-11783-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for this architecture was added in commit:
1d686c3a23f3ae286ef964ab62199be96e4ad1dc

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/fdk-aac/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
index 111de41..b7de699 100644
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -2,6 +2,7 @@
 config BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
+		BR2_aarch64 || \
 		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		BR2_powerpc || BR2_sh
 
-- 
2.7.4
