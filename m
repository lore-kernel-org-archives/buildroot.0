From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:30:02 +0200
Subject: [Buildroot] [PATCH 34/61] package/x11r7/xapp_xdm: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-34-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xdm/xapp_xdm.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_xdm/xapp_xdm.hash

diff --git a/package/x11r7/xapp_xdm/xapp_xdm.hash b/package/x11r7/xapp_xdm/xapp_xdm.hash
new file mode 100644
index 0000000..207d769
--- /dev/null
+++ b/package/x11r7/xapp_xdm/xapp_xdm.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2011-September/001737.html
+sha256	d4da426ddea0124279a3f2e00a26db61944690628ee818a64df9d27352081c47	xdm-1.1.11.tar.bz2
-- 
1.7.10.4
