From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Jun 2017 21:25:37 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: sync with latest defconfig
	additions
Message-ID: <20170608192604.C937A802E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca4322ac242c991214ac4309cbcbe2355ceb9289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5fb6454..7e6882c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -134,6 +134,7 @@ olimex_imx233_olinuxino_defconfig: *defconfig
 openblocks_a6_defconfig: *defconfig
 orangepi_one_defconfig: *defconfig
 orangepi_pc_defconfig: *defconfig
+orangepi_zero_defconfig: *defconfig
 pandaboard_defconfig: *defconfig
 pc_x86_64_bios_defconfig: *defconfig
 pc_x86_64_efi_defconfig: *defconfig
