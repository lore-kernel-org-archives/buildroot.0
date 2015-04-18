From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:30:15 +0200
Subject: [Buildroot] [PATCH 47/61] package/x11r7/xapp_xprop: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-47-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xprop/xapp_xprop.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_xprop/xapp_xprop.hash

diff --git a/package/x11r7/xapp_xprop/xapp_xprop.hash b/package/x11r7/xapp_xprop/xapp_xprop.hash
new file mode 100644
index 0000000..4758979
--- /dev/null
+++ b/package/x11r7/xapp_xprop/xapp_xprop.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-August/002290.html
+sha256	9bee88b1025865ad121f72d32576dd3027af1446774aa8300cce3c261d869bc6	xprop-1.2.2.tar.bz2
-- 
1.7.10.4
