From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 21:51:18 +0100
Subject: [Buildroot] [git commit] gitlab-ci: regenerate after new defconfig
 addition
Message-ID: <20191027204454.6A9478A64D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=907c81a9ec933050a31d35ca61983d30ce33b99e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
