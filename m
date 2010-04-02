From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Apr 2010 15:17:33 +0200
Subject: [Buildroot] [git commit master] Remove ConfigFS from Busybox
	skeleton
Message-ID: <20100402131749.360D98B604@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8801de9c74ecd5c8c23128944b4931988408a630
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not included in generic skeleton and very unlikely
that someone will use it on embedded devices.
AFAIK even Fedora does not include it in fstab.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/target_busybox_skeleton/etc/fstab   |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 target/generic/target_busybox_skeleton/config/.empty

diff --git a/target/generic/target_busybox_skeleton/config/.empty b/target/generic/target_busybox_skeleton/config/.empty
deleted file mode 100644
index e69de29..0000000
diff --git a/target/generic/target_busybox_skeleton/etc/fstab b/target/generic/target_busybox_skeleton/etc/fstab
index 5a351e2..87d9da0 100644
--- a/target/generic/target_busybox_skeleton/etc/fstab
+++ b/target/generic/target_busybox_skeleton/etc/fstab
@@ -5,5 +5,4 @@
 proc		/proc	       proc     defaults	  0	 0
 devpts		/dev/pts       devpts   defaults,gid=5,mode=620	  0	 0
 tmpfs           /tmp           tmpfs    defaults          0      0
-configfs	/config	       configfs defaults	  0	 0
 sysfs		/sys	       sysfs    defaults	  0	 0
-- 
1.6.3.3
