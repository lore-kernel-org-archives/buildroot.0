From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  2 Apr 2020 23:12:24 +0200
Subject: [Buildroot] [PATCH] support/config-fragments/autobuild: update
 OpenRISC toolchain
Message-ID: <20200402211225.2975226-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following commit eee96b0f0ad224b3e09a9b98c26d056e18f17fd5 that adds a
gcc patch for OpenRISC, the OpenRISC pre-built toolchain was
rebuilt. Let's use this new toolchain version for the autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-openrisc-uclibc.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/config-fragments/autobuild/br-openrisc-uclibc.config b/support/config-fragments/autobuild/br-openrisc-uclibc.config
index a4cbc40618..c5391338c0 100644
--- a/support/config-fragments/autobuild/br-openrisc-uclibc.config
+++ b/support/config-fragments/autobuild/br-openrisc-uclibc.config
@@ -1,7 +1,7 @@
 BR2_or1k=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2020.02.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2020.02-500-geee96b0.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-- 
2.25.1
