From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 21:40:33 +0100
Subject: [Buildroot] [git commit] olimex/a20_olinuxino: update readme.txt
	with lime2 info
Message-ID: <20160302202757.22A927FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=937568ea4db373f7acc649a3668386809245ea36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix typo, s/AllWinner/Allwinner/]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/olimex/a20_olinuxino/readme.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
index 7998aa1..485bf56 100644
--- a/board/olimex/a20_olinuxino/readme.txt
+++ b/board/olimex/a20_olinuxino/readme.txt
@@ -3,12 +3,13 @@ A20-OLinuXino-LIME and A20-OLinuXino-MICRO
 Intro
 =====
 
-These are open hardware boards, both based an the AllWinners A20 SoC.
+These are open hardware boards, all based on the Allwinner A20 SoC.
 
 for more details about the boards see the following pages:
  - https://www.olimex.com/Products/OLinuXino/open-source-hardware
  - https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-MICRO/
  - https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME/
+ - https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME2/
 
 The following defconfigs are available:
  - olimex_a20_olinuxino_micro_defconfig
