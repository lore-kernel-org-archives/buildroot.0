From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 16 Feb 2015 10:24:52 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Fix ARM variant typo
Message-ID: <1424075092-19231-1-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/pkg-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 6c9955d..eacd641 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -212,7 +212,7 @@ endif
 ifeq ($(BR2_arm),y)
 CMAKE_SYSTEM_PROCESSOR = $(CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT)l
 else ifeq ($(BR2_armeb),y)
-CMAKE_SYSTEM_PROCESSOR = $(CMAKE_SYSTEM_PROCESSORARM_VARIANT)b
+CMAKE_SYSTEM_PROCESSOR = $(CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT)b
 else
 CMAKE_SYSTEM_PROCESSOR = $(BR2_ARCH)
 endif
-- 
1.9.1
