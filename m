From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 18 Apr 2015 14:52:44 +0200
Subject: [Buildroot] [PATCH 2/4] boot/uboot: add hash file
In-Reply-To: <1429361566-3538-1-git-send-email-joerg.krause@embedded.rocks>
References: <1429361566-3538-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1429361566-3538-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 boot/uboot/uboot.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 boot/uboot/uboot.hash

diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
new file mode 100644
index 0000000..9cc96f6
--- /dev/null
+++ b/boot/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	0a1a70df586655f527befa6f12e184e96ed61b126e5a567382321b17200f5d60  u-boot-2015.04.tar.bz2
-- 
2.3.5
