From: Thiago A. Correa <thiago.correa@gmail.com>
Date: Wed, 23 Jun 2010 23:05:33 +0200
Subject: [Buildroot] [git commit master 1/1] Fix u-boot 2010.03 build for
	AVR32 targets
Message-ID: <20100623210706.56A548188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b1f184a0d8a2471a25d729282456f7aee0f9e858
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/u-boot/u-boot-2010.03-fix-avr32.patch |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 boot/u-boot/u-boot-2010.03-fix-avr32.patch

diff --git a/boot/u-boot/u-boot-2010.03-fix-avr32.patch b/boot/u-boot/u-boot-2010.03-fix-avr32.patch
new file mode 100644
index 0000000..1f9aab8
--- /dev/null
+++ b/boot/u-boot/u-boot-2010.03-fix-avr32.patch
@@ -0,0 +1,5 @@
+diff -Naur u-boot-2010.03-orig/include/asm-avr32/unaligned.h u-boot-2010.03/include/asm-avr32/unaligned.h
+--- u-boot-2010.03-orig/include/asm-avr32/unaligned.h	1969-12-31 21:00:00.000000000 -0300
++++ u-boot-2010.03/include/asm-avr32/unaligned.h	2010-06-22 23:09:49.000000000 -0300
+@@ -0,0 +1 @@
++#include <asm-generic/unaligned.h>
-- 
1.7.1
