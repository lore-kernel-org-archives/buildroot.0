From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 22:55:26 +0100
Subject: [Buildroot] [git commit] package/stm32flash: bump to version 0.5
Message-ID: <20190305095736.32F408E504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40d3f6e85cc95fb0e16086b64c14318ed840e859
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to latest official version.

Signed-off-by: Markus Steinhilber <markus.steinhilber@erbe-med.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stm32flash/stm32flash.hash | 2 ++
 package/stm32flash/stm32flash.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
new file mode 100644
index 0000000000..d12b9354b2
--- /dev/null
+++ b/package/stm32flash/stm32flash.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 73afcbd317ca3eb080c14b6ed1451e5a74a3bbae8f8fb5fe24ea496333f03ead stm32flash-1f934ae86babdeea47afdfae1d856d5fd5da6c53.tar.gz
diff --git a/package/stm32flash/stm32flash.mk b/package/stm32flash/stm32flash.mk
index c41fc76d01..9bb05ab730 100644
--- a/package/stm32flash/stm32flash.mk
+++ b/package/stm32flash/stm32flash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STM32FLASH_VERSION = 4ac0566f188f39eace0223d966d349cd2f2c5895
+STM32FLASH_VERSION = 1f934ae86babdeea47afdfae1d856d5fd5da6c53
 STM32FLASH_SITE = git://git.code.sf.net/p/stm32flash/code
 STM32FLASH_LICENSE = GPL-2.0+
 STM32FLASH_LICENSE_FILES = gpl-2.0.txt
