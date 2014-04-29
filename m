From: Charles Manning <cdhmanning@gmail.com>
Date: Wed, 30 Apr 2014 11:22:23 +1200
Subject: [Buildroot] [PATCH] sockit board: Fix readme.txt
Message-ID: <1398813743-631-1-git-send-email-cdhmanning@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Config name has changed.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 board/altera/sockit/readme.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/altera/sockit/readme.txt b/board/altera/sockit/readme.txt
index f2e420c..b6da489 100644
--- a/board/altera/sockit/readme.txt
+++ b/board/altera/sockit/readme.txt
@@ -41,10 +41,10 @@ How to build it
 Configure Buildroot
 -------------------
 
-The arrow_sockit_defconfig configuration is a minimal configuration with
+The altera_sockit_defconfig configuration is a minimal configuration with
 all that is required to bring the SoCkit :
 
-  $ make arrow_sockit_defconfig
+  $ make altera_sockit_defconfig
 
 Build everything
 ----------------
-- 
1.7.9.5
