From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 21:48:36 +0200
Subject: [Buildroot] [git commit] package/syslog-ng: fix tarball hash
Message-ID: <20210715191849.CEF3D90F2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=d40c21e4ec941889734929588ba9b05fa7126aac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tarball hash added by commit 1054a7aaa238253db8b60e4a520a66ad9e1b1eb1 is
wrong

Fixes:
 - http://autobuild.buildroot.org/results/1ed64d9a2a707cbd06f9d2af29101b70b668bc06

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/syslog-ng/syslog-ng.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 8ed6042eed..d25eb4f69b 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5  syslog-ng-3.32.1.tar.gz
+sha256  19e3b76552d82c71c04230526925402c9f05fa5e6ea19b912b061850929b712d  syslog-ng-3.32.1.tar.gz
 sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
