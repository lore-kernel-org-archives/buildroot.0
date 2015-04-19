From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 14:01:31 +0200
Subject: [Buildroot] [PATCH 3/5] package/ctorrent: add hash
In-Reply-To: <1429444893-13874-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429444893-13874-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429444893-13874-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ctorrent/ctorrent.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ctorrent/ctorrent.hash

diff --git a/package/ctorrent/ctorrent.hash b/package/ctorrent/ctorrent.hash
new file mode 100644
index 0000000..6dcb590
--- /dev/null
+++ b/package/ctorrent/ctorrent.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/dtorrent/files/dtorrent/3.3.2/
+sha1	d4e221f0292268f80e2430ce9d451dd64cf1ffaa	ctorrent-dnh3.3.2.tar.gz
-- 
1.7.10.4
