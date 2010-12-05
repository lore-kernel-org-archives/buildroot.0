From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun,  5 Dec 2010 09:24:49 -0600
Subject: [Buildroot] [PATCH] add zisofs-tools to buildroot config
Message-ID: <d7511b74d51a60fbd941b43c595b6275cc27b122.1291562674.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 03e580a..678db20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -14,6 +14,7 @@ endif
 source "package/lzop/Config.in"
 source "package/lzma/Config.in"
 source "package/xz/Config.in"
+source "package/zisofs-tools/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
-- 
1.7.3.2
