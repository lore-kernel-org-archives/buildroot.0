From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jul 2014 23:51:35 +0200
Subject: [Buildroot] [git commit] toolchain/helpers.mk: update check_arm_abi
	comment
Message-ID: <20140704215155.C669D9D181@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40ff839bc499580d605f6ac3cf019c3af768085b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit b2e88073dbf (toolchain: check ARM EABI vs. EABIhf for external
toolchains), check_arm_abi accepts a second parameter. Update the comment
accordingly.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index c8c645a..8eb71ef 100644
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
