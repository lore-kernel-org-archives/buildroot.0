From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Aug 2019 18:50:59 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: regenerate for new
 defconfig
Message-ID: <20190801164916.CB9B47FEA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bfc93ba6b1d8cef33cdac58bbb47fc97d7b6169
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a8fac3fcfc2c71 introduced qemu_ppc_mac99_defconfig but forgot to
add it to .gitlab-ci.yml.

Do that now.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/263733672

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1a846d402a..dd351fc545 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -268,6 +268,7 @@ qemu_ppc64_e5500_defconfig: { extends: .defconfig }
 qemu_ppc64_pseries_defconfig: { extends: .defconfig }
 qemu_ppc64le_pseries_defconfig: { extends: .defconfig }
 qemu_ppc_g3beige_defconfig: { extends: .defconfig }
+qemu_ppc_mac99_defconfig: { extends: .defconfig }
 qemu_ppc_mpc8544ds_defconfig: { extends: .defconfig }
 qemu_ppc_virtex_ml507_defconfig: { extends: .defconfig }
 qemu_riscv32_virt_defconfig: { extends: .defconfig }
