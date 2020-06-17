From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 20:58:57 +0200
Subject: [Buildroot] [git commit] board/olpc/xo-1: enable ACPI
Message-ID: <20200617190503.37E8E814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4d70701d6b555f0d49c5435d19ed28ccdc01145
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DCON drivers depends on it.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olpc/xo-1/linux.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olpc/xo-1/linux.config b/board/olpc/xo-1/linux.config
index 356fbd6071..2541a310a5 100644
--- a/board/olpc/xo-1/linux.config
+++ b/board/olpc/xo-1/linux.config
@@ -6,7 +6,7 @@ CONFIG_HZ_100=y
 CONFIG_KEXEC=y
 CONFIG_PHYSICAL_START=0x400000
 CONFIG_CMDLINE_BOOL=y
-# CONFIG_ACPI is not set
+CONFIG_ACPI=y
 CONFIG_CPU_IDLE=y
 CONFIG_CPU_IDLE_GOV_LADDER=y
 CONFIG_OLPC=y
