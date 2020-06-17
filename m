From: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 17 Jun 2020 12:49:18 +0200
Subject: [Buildroot] [PATCH v2 10/17] board/olpc/xo-1: enable ACPI
In-Reply-To: <20200617104925.1036330-1-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
Message-ID: <20200617104925.1036330-11-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The DCON drivers depends on it.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
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
-- 
2.26.2
