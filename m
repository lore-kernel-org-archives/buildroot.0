From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Apr 2016 22:08:46 +0200
Subject: [Buildroot] [git commit] mesa3d: needs host-bison and host-flex
Message-ID: <20160408201246.CDA5181D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b38ced5c7dea674a04582c73c00f1d079d49e9f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (host-bison):
http://autobuild.buildroot.net/results/e91/e919dbe6660a6c8c087969a6646e97dd058ce2c7/
Fixes (host-flex):
http://autobuild.buildroot.net/results/66d/66d45e34a38f15e391500ea7f7036606bbaf2655/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b5677f9..27a670e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -17,6 +17,8 @@ MESA3D_INSTALL_STAGING = YES
 MESA3D_PROVIDES =
 
 MESA3D_DEPENDENCIES = \
+	host-bison \
+	host-flex \
 	expat \
 	libdrm
 
