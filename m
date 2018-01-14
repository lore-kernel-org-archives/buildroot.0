From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jan 2018 22:01:15 +0100
Subject: [Buildroot] [PATCH 2/2] minnowboard-max: defconfigs: use silvermont
 x86 variant
In-Reply-To: <20180114210115.7284-1-peter@korsgaard.com>
References: <20180114210115.7284-1-peter@korsgaard.com>
Message-ID: <20180114210115.7284-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As that is the CPU core in the E38xx Atoms used on the Minnowboard max.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/minnowboard_max-graphical_defconfig | 2 +-
 configs/minnowboard_max_defconfig           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 22b10dc733..f05e791a65 100644
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
index f7ba26efdd..9495bf3769 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -1,6 +1,6 @@
 # Architecture
 BR2_x86_64=y
-BR2_x86_atom=y
+BR2_x86_silvermont=y
 
 # Misc
 BR2_SYSTEM_DHCP="eth0"
-- 
2.11.0
