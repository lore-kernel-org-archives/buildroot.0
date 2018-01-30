From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 23:41:53 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] ti-cgt-pru: bump version
 to 2.1.4
Message-ID: <20180130225021.747F58813F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d57974bce2324aebb48925772fa549f161aa2d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Cam Mannett <camden.mannett@protonmail.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 82bc0222e793b10763d5cc20ec26cd6822f96677)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-cgt-pru/ti-cgt-pru.hash | 2 +-
 package/ti-cgt-pru/ti-cgt-pru.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ti-cgt-pru/ti-cgt-pru.hash b/package/ti-cgt-pru/ti-cgt-pru.hash
index 1c19b33fd6..3ff08ace32 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.hash
+++ b/package/ti-cgt-pru/ti-cgt-pru.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	df85cd1ed3aea12d577854ece11bf5f2af6ace8c39959eea4cf2fa5973924e0e	ti_cgt_pru_2.1.3_linux_installer_x86.bin
+sha256	c80dbf35e7401f4c122ff25cc2f6b5db496607782fb4583cee8663a2763f4472	ti_cgt_pru_2.1.4_linux_installer_x86.bin
diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
index d94f09197f..d6de05e5da 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.mk
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TI_CGT_PRU_VERSION = 2.1.3
+TI_CGT_PRU_VERSION = 2.1.4
 TI_CGT_PRU_SOURCE = ti_cgt_pru_$(TI_CGT_PRU_VERSION)_linux_installer_x86.bin
-TI_CGT_PRU_SITE = http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)
+TI_CGT_PRU_SITE = http://downloads.ti.com/codegen/esd/cgt_public_sw/PRU/$(TI_CGT_PRU_VERSION)
 TI_CGT_PRU_LICENSE = TI Technology and Software Publicly Available License (compiler + PRU library), \
 	Boost Software License 1.0 (compiler), \
 	BSD-2c, BSD-3c, MIT, Academic Free License 3.0, Hewlett-Packard (PRU library)
