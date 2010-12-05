From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:36 +0100
Subject: [Buildroot] [PATCH 05/55] Remove useless target/device/mips
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5c4760d2df5ba21ddb10c84770735ba44f7721fa.1291582351.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
