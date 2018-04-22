From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 12:28:40 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: update
 OpenRISC pre-built toolchain
Message-ID: <20180422102852.2540B887B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=473819bbdcae23b04462b196967f65859da5a25a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toolchain has been rebuilt after commit
7fb6fe883a6ee360aa861fdae93d7441f9f5d52d, which adds more fcntl()
definitions in uClibc for OpenRISC.

Fixes:

  http://autobuild.buildroot.net/results/664e7ee968e46b7ac0054ce4d5d4f9a82201550e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-openrisc-uclibc.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/config-fragments/autobuild/br-openrisc-uclibc.config b/support/config-fragments/autobuild/br-openrisc-uclibc.config
index 1cbb205613..a346c83e4c 100644
--- a/support/config-fragments/autobuild/br-openrisc-uclibc.config
+++ b/support/config-fragments/autobuild/br-openrisc-uclibc.config
@@ -1,7 +1,7 @@
 BR2_or1k=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2018.02-891-g046c5e2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2018.02-925-gd4158df.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
