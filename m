From: guoren at kernel.org <guoren@kernel.org>
Date: Fri, 31 May 2019 14:39:08 +0800
Subject: [Buildroot] [PATCH V4 11/11] arch/csky: Enable csky toolchain build
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
Message-ID: <1559284748-32011-12-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Now csky toolchain could be built in buildroot.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index d82803c..db1199c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -77,7 +77,6 @@ config BR2_aarch64_be
 
 config BR2_csky
 	bool "csky"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  csky is processor IP from china.
-- 
2.7.4
