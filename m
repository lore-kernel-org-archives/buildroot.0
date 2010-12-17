From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] Remove useless
	target/device/mips
Message-ID: <20101217160156.677228E9CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=47603d95ba52c58e3835f6fec574393dd3d16532
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/device/mips/Makefile.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)
 delete mode 100644 target/device/mips/Makefile.in

diff --git a/target/device/mips/Makefile.in b/target/device/mips/Makefile.in
deleted file mode 100644
index b6f00dc..0000000
--- a/target/device/mips/Makefile.in
+++ /dev/null
@@ -1,4 +0,0 @@
-ifneq ($(findstring y,$(BR2_mips)$(BR2_mipsel)),)
-BR2_BOARD_PATH:=target/device/mips
-BOARD_PATH:=target/device/mips
-endif
-- 
1.7.2.2
