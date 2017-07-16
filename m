From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 09:59:14 +0200
Subject: [Buildroot] [git commit] minnowboard_max-graphical_defconfig: use
	uClibc-ng
Message-ID: <20170716075534.0D07081838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1eec520aeb7766d5222e32714019b1d684837046
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have wordexp support in uClibc-ng and nodm is available, we can
use it for the graphical defconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/minnowboard_max-graphical_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 3540f9f..621281b 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -4,7 +4,7 @@ BR2_x86_atom=y
 
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System configuration
