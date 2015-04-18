From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:29:48 +0200
Subject: [Buildroot] [PATCH 20/61] package/x11r7/xapp_mkfontdir: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash

diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash
new file mode 100644
index 0000000..7a218b9
--- /dev/null
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2012-February/001818.html
+sha256	56d52a482df130484e51fd066d1b6eda7c2c02ddbc91fe6e2be1b9c4e7306530	mkfontdir-1.0.7.tar.bz2
-- 
1.7.10.4
