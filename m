From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 16:58:21 +0100
Subject: [Buildroot] [git commit] Mark AArch64 as a 64 bits architecture
Message-ID: <20130318174847.ABBB79B166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e7b4ae8d27f612684ce7e82b4d7c53b01c91567
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 472b10c..795f24f 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -25,6 +25,7 @@ config BR2_armeb
 
 config BR2_aarch64
 	bool "AArch64"
+	select BR2_ARCH_IS_64
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
