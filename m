From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 14 Mar 2016 00:00:05 +0100
Subject: [Buildroot] [PATCH 1/4] taskd: move to Miscellaneous menu
Message-ID: <1457910008-19414-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not really a networking tool (if everything that does something on
the network would be called a networking tool, we wouldn't have much
else).

Since we don't really have an appropriate menu for it, put it in
Miscellaneous.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 35a24ba..99ee0c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1315,6 +1315,7 @@ menu "Miscellaneous"
 	source "package/qpdf/Config.in"
 	source "package/shared-mime-info/Config.in"
 	source "package/snowball-init/Config.in"
+	source "package/taskd/Config.in"
 	source "package/wine/Config.in"
 	source "package/xutil_util-macros/Config.in"
 endmenu
@@ -1489,7 +1490,6 @@ endif
 	source "package/sshpass/Config.in"
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
-	source "package/taskd/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
-- 
2.7.0
