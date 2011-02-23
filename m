From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Feb 2011 16:34:49 +0100
Subject: [Buildroot] [git commit master 1/1] docs: cross toolchain is now
	installed into host/usr/bin.
Message-ID: <20110223153511.F205E8F662@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bb6d3d958695e3d36cff2baccd251547443d6251
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index c2d01e7..2314d10 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -241,9 +241,8 @@
       </li>
 
       <li><code>host/</code> contains the installation of tools compiled for
-      the host that are needed for the proper execution of Buildroot, except
-      for the cross-compilation toolchain which is installed under
-      <code>staging/</code>.</li>
+      the host that are needed for the proper execution of Buildroot,
+      including the cross-compilation toolchain.</li>
 
       <li><code>toolchain/</code> contains the build directories for the
       various components of the cross-compilation toolchain.</li>
-- 
1.7.3.4
