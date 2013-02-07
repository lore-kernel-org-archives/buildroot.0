From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Feb 2013 22:58:46 +0100
Subject: [Buildroot] [PATCH v3 4/6] docs/manual: no longer mention the
	package/customize thing
In-Reply-To: <1360274328-14754-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360274328-14754-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360274328-14754-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
---
Changelog v2 -> v3:
 * Add Acked-by from Samuel Martin.
---
 docs/manual/customize-rootfs.txt |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 97af580..95fa91f 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -50,12 +50,6 @@ there are a few ways to customize the resulting target filesystem.
       stored
     - +BASE_DIR+: the base output directory
 
-* A special package, 'customize', stored in +package/customize+ can be
-  used. You can put all the files that you want to see in the final
-  target root filesystem in +package/customize/source+, and then
-  enable this special package in the configuration system. _This
-  method is marked as deprecated_.
-
 Note also that if you want to perform some specific actions *after*
 all filesystem images have been created (for example to automatically
 extract your root filesystem tarball in a location exported by your
-- 
1.7.9.5
