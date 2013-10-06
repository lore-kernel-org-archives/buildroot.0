From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 17:28:04 +0200
Subject: [Buildroot] [PATCH 1/2] media-ctl: bump version
Message-ID: <1381073285-30058-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/media-ctl/media-ctl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/media-ctl/media-ctl.mk b/package/media-ctl/media-ctl.mk
index 64a63aa..ae2482c 100644
--- a/package/media-ctl/media-ctl.mk
+++ b/package/media-ctl/media-ctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEDIA_CTL_VERSION = ac40b79f002a2315f909548614ccd2d408da25b7
+MEDIA_CTL_VERSION = 87f58c2ed885d636229f7209fde883058433a1ce
 MEDIA_CTL_SITE = git://git.ideasonboard.org/media-ctl.git
 MEDIA_CTL_INSTALL_STAGING = YES
 MEDIA_CTL_LICENSE = LGPLv2.1+
-- 
1.8.1.2
