From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 09:49:38 +0100
Subject: [Buildroot] [git commit] binutils: whitespace cleanup
Message-ID: <20140204085348.2B9199C77F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cc853eb10b3ecbdc4bd683205650e05b776e609
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index a8e1e45..49b857e 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -10,8 +10,8 @@ choice
 	  Select the version of binutils you wish to use.
 
 	config BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	       depends on BR2_avr32
-	       bool "binutils 2.18-avr32-1.0.1"
+		depends on BR2_avr32
+		bool "binutils 2.18-avr32-1.0.1"
 
 	config BR2_BINUTILS_VERSION_2_20_1
 		depends on !BR2_avr32
