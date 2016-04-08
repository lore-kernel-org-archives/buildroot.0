From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Apr 2016 09:35:00 -0300
Subject: [Buildroot] [PATCH] mesa3d: needs host-bison and host-flex
Message-ID: <1460118900-22206-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes (host-bison):
http://autobuild.buildroot.net/results/e91/e919dbe6660a6c8c087969a6646e97dd058ce2c7/
Fixes (host-flex):
http://autobuild.buildroot.net/results/66d/66d45e34a38f15e391500ea7f7036606bbaf2655/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
 
-- 
2.7.3
