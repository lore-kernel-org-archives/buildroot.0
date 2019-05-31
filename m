From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 23:00:42 +0200
Subject: [Buildroot] [git commit branch/next] arch/csky: enable internal
 toolchain support
Message-ID: <20190531210134.02DA38EA6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fe2fabdb87e114207f1cfb3ede32c137f3371f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that we have support for C-SKY in gcc, binutils and glibc, we can
use Buildroot to build a C-SKY toolchain.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index d82803c828..db1199c6a2 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -77,7 +77,6 @@ config BR2_aarch64_be
 
 config BR2_csky
 	bool "csky"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  csky is processor IP from china.
