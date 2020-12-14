From: Michael Walle <michael@walle.cc>
Date: Mon, 14 Dec 2020 16:12:34 +0100
Subject: [Buildroot] [PATCH] board/kontron/smarc-sal28: remove "known bugs"
 section
Message-ID: <20201214151234.15650-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the note about non-working network. This was actually fixed with
linux kernel 5.9. This board is now on 5.10.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 board/kontron/smarc-sal28/readme.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/board/kontron/smarc-sal28/readme.txt b/board/kontron/smarc-sal28/readme.txt
index 231c751b66..2047f09b64 100644
--- a/board/kontron/smarc-sal28/readme.txt
+++ b/board/kontron/smarc-sal28/readme.txt
@@ -71,10 +71,3 @@ You will see something like this at boot time:
 [    4.563565] GPT:Alternate GPT header not at the end of the disk.
 [    4.569596] GPT:266272 != 7864319
 [    4.572925] GPT: Use GNU Parted to correct GPT errors.
-
-What does not work
-==================
-
-For reasons unknown, the network card doesn't work if you use the original
-vendor bootloader. Board support patches for upstream u-boot are currently
-pending. Stay tuned.
-- 
2.20.1
