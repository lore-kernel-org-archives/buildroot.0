From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon, 17 Apr 2017 14:57:12 +0530
Subject: [Buildroot] [PATCH 3/4] ti-cgt-pru: use SPDX short identifier for
	license string
In-Reply-To: <1492421233-9868-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1492421233-9868-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1492421233-9868-3-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
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
 
-- 
2.7.4
