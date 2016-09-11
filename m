From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:36:01 +0200
Subject: [Buildroot] [git commit] linux-firmware: bump version
Message-ID: <20160911133605.24F4381913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f158f117d358e9d27c9bb6e7c5a350894b648060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest (as of this writing) linux-firmware git version.
This adds support for newer iwlwifi firmware versions that are required
for newer kernel series.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 5c80c1e..8c983e4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = b0668886def608d352cd0263a7ef04e64e25574a
+LINUX_FIRMWARE_VERSION = c883a6b6186bb2415761d287cbac773062911212
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
