From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Apr 2017 14:33:16 +0200
Subject: [Buildroot] [git commit] ti-cgt-pru: use SPDX short identifier for
	license string
Message-ID: <20170417123448.A4B607FD79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c81eceb37403ed4584cb89abaacbbccc5bb1148f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-cgt-pru/ti-cgt-pru.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
index d6de05e..4f8e70b 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.mk
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -8,8 +8,7 @@ TI_CGT_PRU_VERSION = 2.1.4
 TI_CGT_PRU_SOURCE = ti_cgt_pru_$(TI_CGT_PRU_VERSION)_linux_installer_x86.bin
 TI_CGT_PRU_SITE = http://downloads.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)
 TI_CGT_PRU_LICENSE = TI Technology and Software Publicly Available License (compiler + PRU library), \
-	Boost Software License 1.0 (compiler), \
-	BSD-2c, BSD-3c, MIT, Academic Free License 3.0, Hewlett-Packard (PRU library)
+	BSL-1.0 (compiler), BSD-2-Clause, BSD-3-Clause, MIT, AFL-3.0, Hewlett-Packard (PRU library)
 TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.1.x_manifest.html \
 	PRU_CodeGen_Library_2.1_0222433C-30C1-442d-B5C6-2073BD97F80F.spdx.tag
 
