From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 16:22:34 +0100
Subject: [Buildroot] [git commit] configs/kontron_smarc_sal28_defconfig: use
 Python 3.x for U-Boot build
Message-ID: <20210208150703.8CEBF81535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff727b6124003c5102b037ae5e552d6d2e96efde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New U-Boot versions need Python 3.x for pylibfdt.

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/1006924823

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/kontron_smarc_sal28_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index fd001614f4..4a72bf3ec1 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -26,6 +26,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_sl28"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
