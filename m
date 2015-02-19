From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:28:32 +0100
Subject: [Buildroot] [git commit] pkg-cmake.mk: Fix ARM variant typo
Message-ID: <20150219212836.807C181794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0645153bb3b9a7f85eaae2c1ce8e98f545d6e8b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
