From: Charles Manning <cdhmanning@gmail.com>
Date: Fri, 30 Nov 2012 14:41:51 +1300
Subject: [Buildroot] [PATCH 1/2] Change Filesystem utilities heading because
	it has mtd utils too.
Message-ID: <1354239711-18064-1-git-send-email-cdhmanning@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changing it to Filesystem and flash utilities gives far better navigation
for  mtd utils.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5d9783a..15d7ad6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -177,7 +177,7 @@ source "package/xterm/Config.in"
 source "package/xvkbd/Config.in"
 endmenu
 
-menu "Filesystem utilities"
+menu "Filesystem and flash utilities"
 source "package/cifs-utils/Config.in"
 source "package/cramfs/Config.in"
 source "package/dosfstools/Config.in"
-- 
1.7.1
