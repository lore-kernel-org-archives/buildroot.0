From: Anders Darander <anders@chargestorm.se>
Date: Sat, 11 May 2013 14:57:28 +0200
Subject: [Buildroot] [PATCH v2 4/4] beaglebone: enable NFS root
In-Reply-To: <1368277048-17340-1-git-send-email-anders@chargestorm.se>
References: <1368277048-17340-1-git-send-email-anders@chargestorm.se>
Message-ID: <1368277048-17340-5-git-send-email-anders@chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 board/beaglebone/linux-3.8.config |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.10.4
