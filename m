From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 09:02:51 +0100
Subject: [Buildroot] [git commit] Makefile: update help text for
	savedefconfig
Message-ID: <20150214080306.D8B608043D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c1a75c08f419be9c241d0fd1ccd11ed3b382001
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated text to say that the defconfig is written to the BR2_DEFCONFIG
location.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 338c992..f21f924 100644
--- a/Makefile
+++ b/Makefile
@@ -865,7 +865,7 @@ help:
 	@echo '  randconfig             - New config with random answer to all options'
 	@echo '  defconfig              - New config with default answer to all options'
 	@echo '                             BR2_DEFCONFIG, if set, is used as input'
-	@echo '  savedefconfig          - Save current config as ./defconfig (minimal config)'
+	@echo '  savedefconfig          - Save current config to BR2_DEFCONFIG (minimal config)'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
 	@echo '  randpackageconfig      - New config with random answer to package options'
