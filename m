From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 22:59:51 +0200
Subject: [Buildroot] [git commit] media-ctl: bump version
Message-ID: <20131006210235.172039B94D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f262a247fbaf242682013ec6bf2cdf8dedc0e09c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/media-ctl/media-ctl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
