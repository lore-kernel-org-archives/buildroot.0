From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Wed, 4 Apr 2018 15:55:54 -0700
Subject: [Buildroot] [PATCH] board/atmel: add flasher.sh support for
 at91sam9260ek
Message-ID: <1522882554-3208-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support to the flasher.sh script for the at91sam9260-ek board which
complements the existing at91sam9260eknf_defconfig.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 board/atmel/flasher.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/atmel/flasher.sh b/board/atmel/flasher.sh
index 5064b0b..99050e4 100755
--- a/board/atmel/flasher.sh
+++ b/board/atmel/flasher.sh
@@ -4,6 +4,10 @@ BUILDIR=$1
 TTY=$2
 BOARD=$3
 
+family_at91sam9260ek="at91sam9260ek"
+mach_at91sam9260ek="at91sam9260-ek"
+dtb_at91sam9260ek="at91sam9260ek.dtb"
+
 family_at91sam9g45m10ek="at91sam9m10g45ek"
 mach_at91sam9g45m10ek="at91sam9m10-g45-ek"
 dtb_at91sam9g45m10ek="at91sam9m10g45ek.dtb"
-- 
2.7.4
