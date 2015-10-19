From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 19 Oct 2015 18:24:54 +0200
Subject: [Buildroot] [PATCH 4/4] socfpga: note about unnecessary mkpimage of
	SPL
In-Reply-To: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
References: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1445271894-22553-5-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 board/altera/readme.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/altera/readme.txt b/board/altera/readme.txt
index 882f54d..82c2dcd 100644
--- a/board/altera/readme.txt
+++ b/board/altera/readme.txt
@@ -88,6 +88,8 @@ Remember that without signing the u-boot-spl.bin, the board will not boot !!!
 
   $ mkpimage u-boot-spl.bin -o u-boot-spl-signed.bin
 
+This seems to be not true at least for the socdk board.
+
 Prepare your SDcard
 ===================
 
-- 
2.6.1
