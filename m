From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 10 Sep 2016 08:51:45 -0300
Subject: [Buildroot] [PATCH 2/2] linux-firmware: bump version
In-Reply-To: <1473508305-8603-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473508305-8603-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1473508305-8603-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to the latest (as of this writing) linux-firmware git version.
This adds support for newer iwlwifi firmware versions that are required
for newer kernel series.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
 
-- 
2.7.3
