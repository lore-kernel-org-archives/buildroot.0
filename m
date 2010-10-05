From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Oct 2010 23:14:35 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: 1.17.x.config: enable
	microcom applet
Message-ID: <20101005215019.3C1628B801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a2fcdacad6d6051288982c06c2737eb9e7f251fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So we can get rid of the deprecated microcom package.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.17.x.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox-1.17.x.config b/package/busybox/busybox-1.17.x.config
index 192bba2..d131dd6 100644
--- a/package/busybox/busybox-1.17.x.config
+++ b/package/busybox/busybox-1.17.x.config
@@ -668,7 +668,7 @@ CONFIG_MAKEDEVS=y
 # CONFIG_FEATURE_MAKEDEVS_LEAF is not set
 CONFIG_FEATURE_MAKEDEVS_TABLE=y
 # CONFIG_MAN is not set
-# CONFIG_MICROCOM is not set
+CONFIG_MICROCOM=y
 CONFIG_MOUNTPOINT=y
 CONFIG_MT=y
 # CONFIG_RAIDAUTORUN is not set
-- 
1.7.1
