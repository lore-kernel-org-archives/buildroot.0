From: Bernhard Petschina <bernhard.petschina@gmail.com>
Date: Fri,  2 Jul 2021 11:16:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/stm32flash: bump to version 0.6
Message-ID: <20210702091637.817868-1-bernhard.petschina@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to latest official version.

Signed-off-by: Bernhard Petschina <bernhard.petschina@gmail.com>
---
 package/stm32flash/stm32flash.hash | 2 +-
 package/stm32flash/stm32flash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stm32flash/stm32flash.hash b/package/stm32flash/stm32flash.hash
index 1b06a8f0f0..9bfb3f3be4 100644
--- a/package/stm32flash/stm32flash.hash
+++ b/package/stm32flash/stm32flash.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  42b7d63f6016bd75911cbb87fe85fbc4f98adf3ceecfe6d91f7956b31d18095f  stm32flash-3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650-br1.tar.gz
+sha256  f140dcf9319b0a02c9137bc3824ab4b71719cb5470b3b78bbac7bcef8f299660  stm32flash-82f16f317185b6916e5f8b5697de58960f7e48a7-br1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/stm32flash/stm32flash.mk b/package/stm32flash/stm32flash.mk
index a8ae9b01df..32ca5cf222 100644
--- a/package/stm32flash/stm32flash.mk
+++ b/package/stm32flash/stm32flash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STM32FLASH_VERSION = 3cebf121f7b32b9edfcb0d49f0fb43ccf33e5650
+STM32FLASH_VERSION = 82f16f317185b6916e5f8b5697de58960f7e48a7
 STM32FLASH_SITE = git://git.code.sf.net/p/stm32flash/code
 STM32FLASH_LICENSE = GPL-2.0+
 STM32FLASH_LICENSE_FILES = gpl-2.0.txt
-- 
2.30.2
