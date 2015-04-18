From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:30:16 +0200
Subject: [Buildroot] [PATCH 48/61] package/x11r7/xapp_xrandr: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-48-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xrandr/xapp_xrandr.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_xrandr/xapp_xrandr.hash

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.hash b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
new file mode 100644
index 0000000..009ba5d
--- /dev/null
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2014-August/002467.html
+sha256	7154ac3486b86923692f2d6cdb2991a2ee72bc32af2c4379a6f1c068f204be1b	xrandr-1.4.3.tar.bz2
-- 
1.7.10.4
