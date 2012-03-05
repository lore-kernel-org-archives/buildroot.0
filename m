From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Mar 2012 21:00:08 +0100
Subject: [Buildroot] [PATCH 15/16] external-toolchain: fix description of
	PowerPC 2010.09 from Mentor Graphics
In-Reply-To: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
References: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2ec3e6db46e35ee90bc8eef0d5aedb2891764e8a.1330977548.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
1.7.4.1
