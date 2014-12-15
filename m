From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Dec 2014 19:24:22 -0300
Subject: [Buildroot] [PATCH] configs/qemu: update infos for latest qemu
	version
Message-ID: <1418682262-25510-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/aarch64-virt/readme.txt     | 2 +-
 board/qemu/arm-nuri/readme.txt         | 2 +-
 board/qemu/arm-versatile/readme.txt    | 2 +-
 board/qemu/arm-vexpress/readme.txt     | 2 +-
 board/qemu/microblazebe-mmu/readme.txt | 2 +-
 board/qemu/microblazeel-mmu/readme.txt | 2 +-
 board/qemu/mips-malta/readme.txt       | 2 +-
 board/qemu/mips64-malta/readme.txt     | 2 +-
 board/qemu/mips64el-malta/readme.txt   | 2 +-
 board/qemu/mipsel-malta/readme.txt     | 2 +-
 board/qemu/ppc-g3beige/readme.txt      | 2 +-
 board/qemu/ppc-mpc8544ds/readme.txt    | 1 +
 board/qemu/ppc-virtex-ml507/readme.txt | 2 +-
 board/qemu/ppc64-pseries/readme.txt    | 2 +-
 board/qemu/sh4-r2d/readme.txt          | 2 +-
 board/qemu/sparc-ss10/readme.txt       | 2 +-
 board/qemu/x86/readme.txt              | 2 +-
 board/qemu/x86_64/readme.txt           | 2 +-
 board/qemu/xtensa-lx60/readme.txt      | 2 +-
 19 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index 5d5c581..c174725 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/arm-nuri/readme.txt b/board/qemu/arm-nuri/readme.txt
index 15b5ac7..6fe1ac0 100644
--- a/board/qemu/arm-nuri/readme.txt
+++ b/board/qemu/arm-nuri/readme.txt
@@ -7,4 +7,4 @@ graphical window is the framebuffer.
 
 Startup time is slow because of the SMP CPU emulation so be patient.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index f2a5cd1..cfa30e2 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index df7b720..937a39b 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index eec9175..c6375cc 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index fdec3cb..3a5d55a 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index 048932e..7dac3cb 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index fa7cca6..11fba34 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index 938e39d..8ad80c4 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index 4dbe9b7..27d3153 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index d227650..65cb261 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/ppc-mpc8544ds/readme.txt b/board/qemu/ppc-mpc8544ds/readme.txt
index 7ba4832..8a3374f 100644
--- a/board/qemu/ppc-mpc8544ds/readme.txt
+++ b/board/qemu/ppc-mpc8544ds/readme.txt
@@ -5,3 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 
 Tested with QEMU 2.0.2
+QEMU 2.1.x and 2.2.x are known broken.
diff --git a/board/qemu/ppc-virtex-ml507/readme.txt b/board/qemu/ppc-virtex-ml507/readme.txt
index edf72bd..5713970 100644
--- a/board/qemu/ppc-virtex-ml507/readme.txt
+++ b/board/qemu/ppc-virtex-ml507/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/ppc64-pseries/readme.txt b/board/qemu/ppc64-pseries/readme.txt
index 6ab1d8d..6d5157e 100644
--- a/board/qemu/ppc64-pseries/readme.txt
+++ b/board/qemu/ppc64-pseries/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 732c019..c256f0b 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 0658a81..88f98d5 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index c702557..1d4e123 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 0b5575f..626ec2f 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
index 89c198b..0f138bc 100644
--- a/board/qemu/xtensa-lx60/readme.txt
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.1.2
+Tested with QEMU 2.2.0
-- 
2.0.4
