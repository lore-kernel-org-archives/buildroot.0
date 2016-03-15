From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:49:15 +0100
Subject: [Buildroot] [git commit] gptfdisk: indentation cleanup
Message-ID: <20160315214945.7DFF980F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=678276ca0a77ce76989c7e282ddb9ed903dc7c7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
