From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:30:25 +0200
Subject: [Buildroot] [PATCH 57/61] package/x11r7/xapp_xwd: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-57-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xwd/xapp_xwd.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_xwd/xapp_xwd.hash

diff --git a/package/x11r7/xapp_xwd/xapp_xwd.hash b/package/x11r7/xapp_xwd/xapp_xwd.hash
new file mode 100644
index 0000000..1d9b4d5
--- /dev/null
+++ b/package/x11r7/xapp_xwd/xapp_xwd.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-August/002292.html
+sha256	3bb396a2268d78de4b1c3e5237a85f7849d3434e87b3cd1f4d57eef614227d79	xwd-1.0.6.tar.bz2
-- 
1.7.10.4
