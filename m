From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jan 2013 20:09:51 +0100
Subject: [Buildroot] [PATCH 4/5] docs/manual: no longer mention the
	package/customize thing
In-Reply-To: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358363393-29977-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-rootfs.txt |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 66e38dc..ce62412 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -45,12 +45,6 @@ there are a few ways to customize the resulting target filesystem.
       stored
     - +BASE_DIR+: the base output directory
 
-* A special package, 'customize', stored in +package/customize+ can be
-  used. You can put all the files that you want to see in the final
-  target root filesystem in +package/customize/source+, and then
-  enable this special package in the configuration system. _This
-  method is marked as deprecated_.
-
 Note also that if want to perform some specific actions *after* all
 filesystem images have been created (for example to automatically
 extract your root filesystem tarball in a location exported by your
-- 
1.7.9.5
