From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:29:56 +0200
Subject: [Buildroot] [PATCH 28/61] package/x11r7/xapp_xbacklight: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-28-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xbacklight/xapp_xbacklight.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_xbacklight/xapp_xbacklight.hash

diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
new file mode 100644
index 0000000..058c53f
--- /dev/null
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-October/002331.html
+sha256	17f6cf51a35eaa918abec36b7871d28b712c169312e22a0eaf1ffe8d6468362b	xbacklight-1.2.1.tar.bz2
-- 
1.7.10.4
