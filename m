From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Oct 2019 21:45:03 +0100
Subject: [Buildroot] [PATCH 1/2] gitlab-ci: regenerate after new defconfig
 addition
In-Reply-To: <cover.1572209096.git.yann.morin.1998@free.fr>
References: <cover.1572209096.git.yann.morin.1998@free.fr>
Message-ID: <5c419050d8186187962bd2536db37a4eb2c45e63.1572209096.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5466c4096d..7e633b3b19 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -254,6 +254,7 @@ qemu_aarch64_virt_defconfig: { extends: .defconfig }
 qemu_arm_versatile_defconfig: { extends: .defconfig }
 qemu_arm_versatile_nommu_defconfig: { extends: .defconfig }
 qemu_arm_vexpress_defconfig: { extends: .defconfig }
+qemu_arm_vexpress_tz_defconfig: { extends: .defconfig }
 qemu_csky610_virt_defconfig: { extends: .defconfig }
 qemu_csky807_virt_defconfig: { extends: .defconfig }
 qemu_csky810_virt_defconfig: { extends: .defconfig }
-- 
2.20.1
