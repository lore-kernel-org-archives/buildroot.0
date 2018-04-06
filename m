From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Fri, 6 Apr 2018 13:57:46 -0700
Subject: [Buildroot] [PATCH v2 2/2] atmel: add support for at91sam9g20ek to
 flasher.sh
In-Reply-To: <1523048266-28521-1-git-send-email-joshua.henderson@microchip.com>
References: <1523048266-28521-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <1523048266-28521-2-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Prasanthi Chellakumar <prasanthi.chellakumar@microchip.com>

Adds support for the at91sam9g20-ek board to the flasher.sh script.

Signed-off-by: Prasanthi Chellakumar <prasanthi.chellakumar@microchip.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

---

v2:
- Change help to correct at91sam9g20ek name
---
 board/atmel/flasher.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/atmel/flasher.sh b/board/atmel/flasher.sh
index 8cae6af..a7409ce 100755
--- a/board/atmel/flasher.sh
+++ b/board/atmel/flasher.sh
@@ -20,6 +20,10 @@ family_at91sam9g15ek="at91sam9x5ek"
 mach_at91sam9g15ek="at91sam9g15-ek"
 dtb_at91sam9g15ek="at91sam9g15ek.dtb"
 
+family_at91sam9g20ek="at91sam9g20ek"
+mach_at91sam9g20ek="at91sam9g20-ek"
+dtb_at91sam9g20ek="at91sam9g20ek.dtb"
+
 family_at91sam9g25ek="at91sam9x5ek"
 mach_at91sam9g25ek="at91sam9g25-ek"
 dtb_at91sam9g25ek="at91sam9g25ek.dtb"
@@ -98,6 +102,7 @@ Available boards:
   at91sam9g45m10ek
   at91sam9rlek
   at91sam9g15ek
+  at91sam9g20ek
   at91sam9g25ek
   at91sam9x25ek
   at91sam9g35ek
-- 
2.7.4
