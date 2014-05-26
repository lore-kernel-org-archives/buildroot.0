From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 14:25:43 +0200
Subject: [Buildroot] [git commit] package/binutils: add depends for
	powerpc64le (only 2.24 works)
Message-ID: <20140601083246.0F5AA9CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89e934baab9167d39fab2eecbd3cd0daf42b6906
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 0f7321e..08540a3 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -14,30 +14,30 @@ choice
 		bool "binutils 2.18-avr32-1.0.1"
 
 	config BR2_BINUTILS_VERSION_2_20_1
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.20.1"
 
 	config BR2_BINUTILS_VERSION_2_21
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21.1"
 
 	config BR2_BINUTILS_VERSION_2_22
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.22"
 
 	config BR2_BINUTILS_VERSION_2_23_1
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.23.1"
 
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
