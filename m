From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 20:26:38 +0100
Subject: [Buildroot] [git commit] external-toolchain: fix description of
	PowerPC 2010.09 from Mentor Graphics
Message-ID: <20120306223952.38C2C90D18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ec3e6db46e35ee90bc8eef0d5aedb2891764e8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d3b591d..f3f49e9 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -240,7 +240,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Sourcery CodeBench toolchain for the PowerPC architecture,
-	  from Sourcery CodeBench. It uses gcc 4.5.1, binutils 2.20,
+	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
 	  glibc 2.11, gdb 7.2.50 and kernel headers 2.6.35.2. It has
 	  support for the following variants:
             - 603 glibc, 32 bits
