From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 15:26:03 +0100
Subject: [Buildroot] [git commit] minnowboard-max: defconfigs: use
 silvermont x86 variant
Message-ID: <20180115142639.11ED783C62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c3a93330d4978ac95a6e9978fcc8de60ad5313b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As that is the CPU core in the E38xx Atoms used on the Minnowboard max.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/minnowboard_max-graphical_defconfig | 2 +-
 configs/minnowboard_max_defconfig           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 22b10dc..f05e791 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -1,6 +1,6 @@
 # Architecture
 BR2_x86_64=y
-BR2_x86_atom=y
+BR2_x86_silvermont=y
 
 # Toolchain
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index f7ba26e..9495bf3 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -1,6 +1,6 @@
 # Architecture
 BR2_x86_64=y
-BR2_x86_atom=y
+BR2_x86_silvermont=y
 
 # Misc
 BR2_SYSTEM_DHCP="eth0"
