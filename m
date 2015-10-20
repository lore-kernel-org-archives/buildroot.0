From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 20 Oct 2015 13:32:21 +0200
Subject: [Buildroot] [PATCH v2 3/7] altera: improve readme to cover both
	supported boards
In-Reply-To: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
References: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1445340745-1000-4-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 board/altera/readme.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/board/altera/readme.txt b/board/altera/readme.txt
index 8d5b891..ddd9e03 100644
--- a/board/altera/readme.txt
+++ b/board/altera/readme.txt
@@ -1,4 +1,4 @@
-SoCkit
+SoCkit, SoC Development Kit
 
 Intro
 =====
@@ -6,9 +6,12 @@ Intro
 This is the buildroot board support for the Arrow SoCkit Evaluation Board
 and the Altera Cyclone 5 Development Board.
 
-A good source of information is :
+A good source of information for Arrow SoCkit:
 http://www.rocketboards.org/foswiki/Documentation/ArrowSoCKitEvaluationBoard
 
+More information about SoC DK:
+https://www.altera.com/products/boards_and_kits/dev-kits/altera/kit-cyclone-v-soc.html
+
 How it works
 ============
 
-- 
2.6.1
