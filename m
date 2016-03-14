From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 23:43:37 +0100
Subject: [Buildroot] [git commit] taskd: move to Miscellaneous menu
Message-ID: <20160314224357.6040E807AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2342006125739e3dcbbdd84a13f93f93fec34ffa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's not really a networking tool (if everything that does something on
the network would be called a networking tool, we wouldn't have much
else).

Since we don't really have an appropriate menu for it, put it in
Miscellaneous.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 2e00fbb..7128bca 100644
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
@@ -1490,7 +1491,6 @@ endif
 	source "package/sshpass/Config.in"
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
-	source "package/taskd/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
