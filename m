From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 23:49:11 +0200
Subject: [Buildroot] [git commit] package/qemu: remove comment about sh64
Message-ID: <20190802214910.44A058142D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4dae144f7813071d4e7d5881992470100fbe8e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sh64 has been removed since commit [1]:

[1] 4338a319b72570e433fd7484f8a95e1e0e978941

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/qemu.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index f4fa20abab..2a148c8b6e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -186,7 +186,6 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 #       sh4eb           sh4eb
 #       sh4a            sh4
 #       sh4aeb          sh4eb
-#       sh64            not supported
 #       sparc           sparc
 #       sparc64         sparc64
 
