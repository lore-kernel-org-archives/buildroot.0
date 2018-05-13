From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:09:01 +0200
Subject: [Buildroot] [git commit] support/kconfig: Add missing target to
 README.buildroot
Message-ID: <20180513200824.4EC778A50A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04918ca72f7d558022a8679df6519c90a579424a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/kconfig/README.buildroot | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.buildroot
index 62e3a11b1e..3140713b39 100644
--- a/support/kconfig/README.buildroot
+++ b/support/kconfig/README.buildroot
@@ -15,6 +15,7 @@ Then verify the toplevel targets work:
 	config
 	defconfig
 	menuconfig
+	nconfig
 	xconfig
 	gconfig
 	oldconfig
