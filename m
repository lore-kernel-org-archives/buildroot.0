From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:30:17 +0200
Subject: [Buildroot] [PATCH 49/61] package/x11r7/xapp_xrdb: add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-49-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xrdb/xapp_xrdb.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xapp_xrdb/xapp_xrdb.hash

diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.hash b/package/x11r7/xapp_xrdb/xapp_xrdb.hash
new file mode 100644
index 0000000..4844a09
--- /dev/null
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-September/002316.html
+sha256	73827b6bbfc9d27ca287d95a1224c306d7053cd7b8156641698d7dc541ca565b	xrdb-1.1.0.tar.bz2
-- 
1.7.10.4
