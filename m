From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 29 Oct 2014 14:56:40 +0100
Subject: [Buildroot] [PATCH 1/1] fix minor typo in kexec description
Message-ID: <1414591001-25080-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/kexec/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 0139c17..d92e6b9 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KEXEC
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
 		BR2_powerpc || BR2_sh4 || BR2_sh4a
 	help
-	  Kexec is a user space utiltity for loading another kernel
+	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with it.
 
 	  https://www.kernel.org/pub/linux/utils/kernel/kexec/
-- 
2.0.0
