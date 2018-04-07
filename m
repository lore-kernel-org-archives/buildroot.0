From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Apr 2018 09:05:32 +0200
Subject: [Buildroot] [git commit] atmel: add support for at91sam9g20ek to
 flasher.sh
Message-ID: <20180407070541.D76ED81007@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7c885ea3ff4883a7e33d4604b2d057814d0ca32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for the at91sam9g20-ek board to the flasher.sh script.

Signed-off-by: Prasanthi Chellakumar <prasanthi.chellakumar@microchip.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/atmel/flasher.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/atmel/flasher.sh b/board/atmel/flasher.sh
index 8cae6af906..a7409ce880 100755
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
