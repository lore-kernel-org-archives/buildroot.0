From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:40:40 +0200
Subject: [Buildroot] [git commit] linux-firmware: bump version
Message-ID: <20160424214207.2669A81D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bc16867aae66e315b77299c8fc1d13d6edbbbeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest (as of this writing) linux-firmware git version.
This adds support for newer iwlwifi firmware versions and new chipset
support as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 532604b..9a45ccc 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = bbe4917c054eb0a73e250c6363341e3bf6725839
+LINUX_FIRMWARE_VERSION = b0668886def608d352cd0263a7ef04e64e25574a
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
