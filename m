From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 02:08:46 -0300
Subject: [Buildroot] [PATCH v2 33/37] qemu/Config.in.host: fix overindented
 depends on
In-Reply-To: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
Message-ID: <20180401050850.5701-34-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do the same as used in all other Config.in files and use only one tab.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - no changes
---
 package/qemu/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index bbc2aa27c5..0ef4c700b0 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
 		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
 		BR2_sparc        || BR2_x86_64
-		depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
+	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
-- 
2.14.1
