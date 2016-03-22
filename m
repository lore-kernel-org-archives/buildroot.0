From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:47:06 +0100
Subject: [Buildroot] [git commit] altera: improve readme to cover both
	supported boards
Message-ID: <20160322225028.39C5F7FFED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1039811491f81e9b3db160627acab082e2b7b7f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
