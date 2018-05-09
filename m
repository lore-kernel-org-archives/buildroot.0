From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed,  9 May 2018 18:44:11 +0200
Subject: [Buildroot] [PATCH v2 1/2] support/kconfig: Add missing target to
 README.buildroot
Message-ID: <20180509164412.31596-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
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
-- 
2.16.3
