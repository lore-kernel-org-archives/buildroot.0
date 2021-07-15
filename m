From: Bernhard Petschina <bernhard.petschina@gmail.com>
Date: Thu, 15 Jul 2021 14:56:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/stm32flash: bump to version 0.6
Message-ID: <20210715125619.521764-1-bernhard.petschina@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Bump to latest official version.

Signed-off-by: Bernhard Petschina <bernhard.petschina@gmail.com>
---
 package/stm32flash/stm32flash.hash | 2 +-
 package/stm32flash/stm32flash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
index 1b06a8f0f0..514d71f823 100644
--- a/package/stm32flash/stm32flash.hash
+++ b/package/stm32flash/stm32flash.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  42b7d63f6016bd75911cbb87fe85fbc4f98adf3ceecfe6d91f7956b31d18095f  stm32flash-3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650-br1.tar.gz
+sha256  dec1a81a3ba85a61dfa39ec12e391ea16a8d431470f41d34413f7ab183da46ef  stm32flash-v0.6-br1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/stm32flash/stm32flash.mk b/package/stm32flash/stm32flash.mk
index a8ae9b01df..1c68a0ffbe 100644
--- a/package/stm32flash/stm32flash.mk
+++ b/package/stm32flash/stm32flash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STM32FLASH_VERSION = 3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650
+STM32FLASH_VERSION = v0.6
 STM32FLASH_SITE = git://git.code.sf.net/p/stm32flash/code
 STM32FLASH_LICENSE = GPL-2.0+
 STM32FLASH_LICENSE_FILES = gpl-2.0.txt
-- 
2.30.2
