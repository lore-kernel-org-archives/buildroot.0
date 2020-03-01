From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 19:15:50 +0100
Subject: [Buildroot] [git commit] package/systemd: also fix rpath for nspawn
Message-ID: <20200301180537.F07FB8F0F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ae12f05ee70da9e15ddba26e98e2db779078e34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/e03ae6a3209eea00459b94cee9c10fd4f2184fec/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1150fd390e..bed4ed0be7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -571,6 +571,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
 HOST_SYSTEMD_HOST_TOOLS = \
 	systemd-analyze \
 	systemd-mount \
+	systemd-nspawn \
 	systemctl \
 	udevadm
 
