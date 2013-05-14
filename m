From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 May 2013 22:51:18 +0200
Subject: [Buildroot] [git commit branch/next] beaglebone: enable NFS root
	support
Message-ID: <20130514205255.19FFA9A1F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=594f07e85221fcf7bf7228804e9c7499a69fd5f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Anders Darander <anders@chargestorm.se>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/beaglebone/linux-3.8.config |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/board/beaglebone/linux-3.8.config b/board/beaglebone/linux-3.8.config
index c083c70..4242771 100644
--- a/board/beaglebone/linux-3.8.config
+++ b/board/beaglebone/linux-3.8.config
@@ -179,6 +179,8 @@ CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_PRINTK_TIME=y
