From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 09:31:19 +0200
Subject: [Buildroot] [git commit] package/pciutils: add license hash
Message-ID: <20190801073837.EA9A67FF2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=156302f0215b4fc3c5a0694cea2c8a2962c434bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pciutils/pciutils.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 80d7041a4f..da0358cacd 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,2 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
 sha256	1d62f8fa192f90e61c35a6fc15ff3cb9a7a792f782407acc42ef67817c5939f5	pciutils-3.5.5.tar.xz
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
