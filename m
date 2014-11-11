From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Nov 2014 22:59:04 +0100
Subject: [Buildroot] [git commit] configs/apf9328: don't use sstrip
Message-ID: <20141111221026.229AAB4389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7354f59cae031cac45e95cac5d6a1d330e1ae391
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no reason in a defconfig to select sstrip specifically, so
let's get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/armadeus_apf9328_defconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index b42f757..806e9a8 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -3,7 +3,6 @@ BR2_arm=y
 BR2_arm920t=y
 
 # Toolchain
-BR2_STRIP_sstrip=y
 BR2_GCC_VERSION_4_4_X=y
 BR2_PACKAGE_GDB=y
 BR2_PACKAGE_HOST_GDB=y
