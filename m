From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Jul 2011 07:34:09 +0200
Subject: [Buildroot] [git commit] busybox: busybox-1.18.x.config: enable
	blkid applet
Message-ID: <20110722053531.AFA498B3D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4ec2e3bb53ec57e3b64b4b49918a5e8f53e1eb97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by usbmount.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.18.x.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox-1.18.x.config b/package/busybox/busybox-1.18.x.config
index 4c43b7a..502048d 100644
--- a/package/busybox/busybox-1.18.x.config
+++ b/package/busybox/busybox-1.18.x.config
@@ -514,7 +514,7 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 # CONFIG_REV is not set
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
-# CONFIG_BLKID is not set
+CONFIG_BLKID=y
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
 # CONFIG_FBSET is not set
-- 
1.7.3.4
