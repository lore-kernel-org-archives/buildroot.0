From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 10 Mar 2016 20:38:15 -0300
Subject: [Buildroot] [PATCH] gptfdisk: indentation cleanup
Message-ID: <1457653095-27369-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/gptfdisk/Config.in.host | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gptfdisk/Config.in.host b/package/gptfdisk/Config.in.host
index fb7c682..1300d02 100644
--- a/package/gptfdisk/Config.in.host
+++ b/package/gptfdisk/Config.in.host
@@ -2,10 +2,10 @@ config BR2_PACKAGE_HOST_GPTFDISK
 	bool "host gptfdisk"
 	select BR2_PACKAGE_HOST_UTIL_LINUX
 	help
-          GPT fdisk (consisting of the gdisk and sgdisk programs) is a
-          text-mode partitioning tool that works on Globally Unique
-          Identifier (GUID) Partition Table (GPT) disks, rather than
-          on the more common (through 2010) Master Boot Record (MBR)
-          partition tables.
+	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
+	  text-mode partitioning tool that works on Globally Unique
+	  Identifier (GUID) Partition Table (GPT) disks, rather than
+	  on the more common (through 2010) Master Boot Record (MBR)
+	  partition tables.
 
-          http://www.rodsbooks.com/gdisk/
+	  http://www.rodsbooks.com/gdisk/
-- 
1.9.1
