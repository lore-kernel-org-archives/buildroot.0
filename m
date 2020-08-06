From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Aug 2020 22:33:29 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: update
 bleeding-edge br-arm-internal-glibc
Message-ID: <20200806203050.E96CC841B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f7807944631d1189ad2c3081559ccef63ca2f04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update our bleeding edge br-arm-internal-glibc defconfig to use the
latest version of gcc and binutils, so that we test these in the
autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-arm-internal-glibc.config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/config-fragments/autobuild/br-arm-internal-glibc.config b/support/config-fragments/autobuild/br-arm-internal-glibc.config
index 7c9b465a88..ea6df7fbd9 100644
--- a/support/config-fragments/autobuild/br-arm-internal-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-internal-glibc.config
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_BINUTILS_VERSION_2_32_X=y
-BR2_GCC_VERSION_9_X=y
+BR2_BINUTILS_VERSION_2_34_X=y
+BR2_GCC_VERSION_10_X=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
