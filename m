From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Nov 2014 23:00:47 +0100
Subject: [Buildroot] [git commit] configs/apf9328: use default gcc version
Message-ID: <20141111221026.2A7F5B4389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef83e9d978cace4cf260c1c3db6f4f5467f20afc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gcc 4.4 version has been deprecated recently, so we cannot use it
anymore. Since this platform is just using a normal ARM processor with
nothing special, we can expect the default gcc version to just work.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/armadeus_apf9328_defconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index 806e9a8..048bd28 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -3,7 +3,6 @@ BR2_arm=y
 BR2_arm920t=y
 
 # Toolchain
-BR2_GCC_VERSION_4_4_X=y
 BR2_PACKAGE_GDB=y
 BR2_PACKAGE_HOST_GDB=y
 BR2_ENABLE_LOCALE_PURGE=y
