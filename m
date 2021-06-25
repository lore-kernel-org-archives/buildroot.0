From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jun 2021 13:44:51 +0200
Subject: [Buildroot] [git commit]
 support/config-fragments/autobuild/br-arm-internal-glibc: update to
 bleeding edge components
Message-ID: <20210625111337.EB36883F59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bb260cf38603d49f9ac55e8d37031698d41b7a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The br-arm-internal-glibc.config is generally used as a configuration
to test the bleeding edge versions of components. However, it has been
lagging behind somewhat, so let's bring it up-to-date:

 - Binutils 2.36.x
 - GCC 11.x

Let the fun begin in the autobuilders!

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/config-fragments/autobuild/br-arm-internal-glibc.config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/config-fragments/autobuild/br-arm-internal-glibc.config b/support/config-fragments/autobuild/br-arm-internal-glibc.config
index ea6df7fbd9..fb930cbef7 100644
--- a/support/config-fragments/autobuild/br-arm-internal-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-internal-glibc.config
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_BINUTILS_VERSION_2_34_X=y
-BR2_GCC_VERSION_10_X=y
+BR2_BINUTILS_VERSION_2_36_X=y
+BR2_GCC_VERSION_11_X=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
