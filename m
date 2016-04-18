From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:24:04 +0200
Subject: [Buildroot] [git commit] elf2flt: enable for xtensa
Message-ID: <20160418192408.CAC50817D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86e8062ecdf9153a15ea7145efd37ebee647ee85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elf2flt/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index eb86b11..b93795b 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_sh || BR2_sparc
+	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa
 	depends on !BR2_USE_MMU
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
