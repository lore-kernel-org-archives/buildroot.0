From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:30:07 +0200
Subject: [Buildroot] [PATCH 39/61] package/x11r7/xapp_xkbcomp: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-39-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
new file mode 100644
index 0000000..b49d5a2
--- /dev/null
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2014-November/002497.html
+sha256	cfac973778fabf5216121ad60b7af8ab74ce7513af0f9260cf8c5309e1622b2a	xkbcomp-1.3.0.tar.bz2
-- 
1.7.10.4
