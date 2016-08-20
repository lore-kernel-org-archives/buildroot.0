From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 12:21:52 +0200
Subject: [Buildroot] [git commit] linknx: add additional upstream URL
Message-ID: <20160820102233.7161381EE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1670837ef3df31e743a8a8bd58b25d631e149581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the SourceForge page still exists, it seems to be a bit outdated,
and there is now a much newer Github repository with recent activity, so
mention it as well in the Config.in help text.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linknx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index ca55c8b..e858389 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LINKNX
 	  to EIB/KNX installation.
 
 	  http://linknx.sourceforge.net/
+	  https://github.com/linknx/linknx
 
 comment "linknx needs a toolchain w/ C++"
 	depends on BR2_USE_MMU
