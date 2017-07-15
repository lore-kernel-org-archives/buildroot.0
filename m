From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Jul 2017 16:12:52 +0200
Subject: [Buildroot] [PATCH 1/2] minnowboard_max-graphical_defconfig: use
	uClibc-ng
Message-ID: <20170715141253.4306-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have wordexp support in uClibc-ng and nodm is available, we can
use it for the graphical defconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/minnowboard_max-graphical_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 3540f9fa87..621281b93c 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -4,7 +4,7 @@ BR2_x86_atom=y
 
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System configuration
-- 
2.11.0
