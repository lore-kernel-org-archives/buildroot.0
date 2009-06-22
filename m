From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Jun 2009 15:16:13 +0200
Subject: [Buildroot] [git commit] busybox: 1.13.x defconfig: enable devmem
	applet
Message-ID: <20090622132901.57D11777A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=263c8dc7b89b997b011214e224074e03279a37a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Small and useful for a lot of early hardware testing/verification.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.13.x.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox-1.13.x.config b/package/busybox/busybox-1.13.x.config
index 0846eaf..ee59162 100644
--- a/package/busybox/busybox-1.13.x.config
+++ b/package/busybox/busybox-1.13.x.config
@@ -562,7 +562,7 @@ CONFIG_DC=y
 # CONFIG_DEVFSD_FG_NP is not set
 # CONFIG_DEVFSD_VERBOSE is not set
 # CONFIG_FEATURE_DEVFS is not set
-# CONFIG_DEVMEM is not set
+CONFIG_DEVMEM=y
 CONFIG_EJECT=y
 # CONFIG_FEATURE_EJECT_SCSI is not set
 # CONFIG_FBSPLASH is not set
-- 
1.6.0.6
