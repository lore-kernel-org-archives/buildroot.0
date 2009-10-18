From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Oct 2009 09:29:50 +0200
Subject: [Buildroot] [git commit master] docs/buildroot.html: remove mention
	of skel.tar.gz
Message-ID: <20091018073233.04C11776E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7a83c1458f8916385801450e799ddc15849e7093
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We haven't used a tarball for the skeleton since we moved to subversion
in 2006.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index e61e05f..0b2e1b4 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -313,12 +313,7 @@ $ export BUILDROOT_COPYTO=/tftpboot
       toolchain and the tools. <br />
       You can also customize the <code>target/generic/device_table.txt</code>
       file which is used by the tools that generate the target filesystem image
-      to properly set permissions and create device nodes. The
-      <code>target/generic/skel.tar.gz</code> file contains the main
-      directories of a root filesystem and there is no obvious reason for which
-      it should be changed. These main directories are in an tarball inside of
-      inside the skeleton because it contains symlinks that would be broken
-      otherwise. <br />
+      to properly set permissions and create device nodes.<br />
       These customizations are deployed into
       <code>output/target/</code> just before the actual image
       is made. So simply rebuilding the image by running
-- 
1.6.3.3
