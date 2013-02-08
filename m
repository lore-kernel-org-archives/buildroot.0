From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 22:06:41 +0100
Subject: [Buildroot] [git commit] docs/manual: no longer mention the
	package/customize thing
Message-ID: <20130208210652.11BA3800DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=598fe672135fad66b55b4ab79a59e8110f3c590e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/customize-rootfs.txt |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index f396c0d..5692887 100644
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
