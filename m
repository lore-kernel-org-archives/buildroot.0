From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 14 Jan 2020 21:17:07 -0500
Subject: [Buildroot] [PATCH v2 1/3] ti-cgt-pru: bump to latest version 2.3.3
In-Reply-To: <20200115021709.64647-1-ashcharles@gmail.com>
References: <20200114005842.45810-2-ashcharles@gmail.com>
 <20200115021709.64647-1-ashcharles@gmail.com>
Message-ID: <20200115021709.64647-2-ashcharles@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to the latest version of the PRU code generation toolchain [1].
The license files differ only in whitespace and the version numbers
references compared with the previous release.

[1] https://release-monitoring.org/project/59398/

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 package/ti-cgt-pru/ti-cgt-pru.hash | 6 +++---
 package/ti-cgt-pru/ti-cgt-pru.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/ti-cgt-pru/ti-cgt-pru.hash b/package/ti-cgt-pru/ti-cgt-pru.hash
index 1975d8d1e6..4dee321838 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.hash
+++ b/package/ti-cgt-pru/ti-cgt-pru.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	7dc37fd689d1d506bf410d2a00af658b93a58d4bc10ac32c2210129dab617377	ti_cgt_pru_2.2.1_linux_installer_x86.bin
-sha256	eb646f4f8b14351110992b40ba24d12803bcc150a76e7298705f51088b0a09cc	PRU_Code_Generation_Tools_2.2.x_manifest.html
-sha256	6b98f9262abd1ae9a3731e6feee02a56b6e290542dea119eeeeaf88bf802aabc	pru_rts_2_2_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
+sha256	1f1405167214f2c0ef848591b17a7799fdcd9f55f11bc90db9ace3490d426215	ti_cgt_pru_2.3.3_linux_installer_x86.bin
+sha256	913cb4ab564f874b7c9a11726a16c4ccdc7ecc60be2738201281a1e28dc93641	PRU_Code_Generation_Tools_2.3.x_manifest.html
+sha256	5e198df9782c63cedc8363f0e298b241a9a8084398a925f6e1003dbcb60801cb	pru_rts_2_3_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
index 3665d2cec8..8bf907cc95 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.mk
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TI_CGT_PRU_VERSION = 2.2.1
+TI_CGT_PRU_VERSION = 2.3.3
 TI_CGT_PRU_SOURCE = ti_cgt_pru_$(TI_CGT_PRU_VERSION)_linux_installer_x86.bin
 TI_CGT_PRU_SITE = http://downloads.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)
 TI_CGT_PRU_LICENSE = TI Technology and Software Publicly Available License (compiler + PRU library), \
 	BSL-1.0 (compiler), BSD-2-Clause, BSD-3-Clause, MIT, AFL-3.0, Hewlett-Packard (PRU library)
-TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.2.x_manifest.html \
-	pru_rts_2_2_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
+TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.3.x_manifest.html \
+	pru_rts_2_3_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
 
 define HOST_TI_CGT_PRU_EXTRACT_CMDS
 	chmod +x $(HOST_TI_CGT_PRU_DL_DIR)/$(TI_CGT_PRU_SOURCE)
-- 
2.24.1
