From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  3 Jul 2014 12:35:57 +0300
Subject: [Buildroot] [PATCH] toolchain/helpers.mk: update check_arm_abi
	comment
Message-ID: <cb98e542722d29f05ba0d9e3fae43c1a6cefbd0d.1404380157.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit b2e88073dbf (toolchain: check ARM EABI vs. EABIhf for external
toolchains), check_arm_abi accepts a second parameter. Update the comment
accordingly.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/helpers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 81e02b713284..c85968054012 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -288,6 +288,7 @@ check_uclibc = \
 # configuration of the external toolchain.
 #
 # $1: cross-gcc path
+# $2: cross-readelf path
 #
 check_arm_abi = \
 	__CROSS_CC=$(strip $1) ; \
-- 
2.0.0
