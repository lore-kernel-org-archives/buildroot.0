From: Cam Mannett <camden.mannett@protonmail.ch>
Date: Fri, 24 Feb 2017 11:37:01 -0500
Subject: [Buildroot] [PATCH 2/2] ti-cgt-pru: bump version to 2.1.4
Message-ID: <ufQrfAHyF4y9LTbgiwj83-D0goNEkM6InucWv6QSLWrtydwpF09fcHBXKuRNPh0tHl0lkarODF96sEiuPaBAm7QuQu9VDjYrk9sF8QBCUKA=@protonmail.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Camden Mannett <camden.mannett@protonmail.ch>
---
package/ti-cgt-pru/ti-cgt-pru.hash | 2 +-
package/ti-cgt-pru/ti-cgt-pru.mk | 4 ++--
2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ti-cgt-pru/ti-cgt-pru.hash b/package/ti-cgt-pru/ti-cgt-pru.hash
index 1c19b33..3ff08ac 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.hash
+++ b/package/ti-cgt-pru/ti-cgt-pru.hash
@@ -1,2 +1,2 @@
# Locally calculated
-sha256 df85cd1ed3aea12d577854ece11bf5f2af6ace8c39959eea4cf2fa5973924e0e ti_cgt_pru_2.1.3_linux_installer_x86.bin
+sha256 c80dbf35e7401f4c122ff25cc2f6b5db496607782fb4583cee8663a2763f4472 ti_cgt_pru_2.1.4_linux_installer_x86.bin
diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
index d94f091..d6de05e 100644
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
--
2.9.3
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170224/995d711a/attachment.html>
