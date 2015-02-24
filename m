From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Feb 2015 15:28:43 +0100
Subject: [Buildroot] [git commit] busybox: enable flock applet
Message-ID: <20150302222723.3C3CC8057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91374388d0ca560532578b1db951a7c34f292c4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by E.G. the default odhcp6c state script.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 7af7eca..20b8c1d 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -575,7 +575,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
 CONFIG_FEATURE_GPT_LABEL=y
 CONFIG_FEATURE_FDISK_ADVANCED=y
 # CONFIG_FINDFS is not set
-# CONFIG_FLOCK is not set
+CONFIG_FLOCK=y
 CONFIG_FREERAMDISK=y
 # CONFIG_FSCK_MINIX is not set
 # CONFIG_MKFS_EXT2 is not set
