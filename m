From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 17:42:30 +0200
Subject: [Buildroot] [PATCH 4/5] package/libart: add hash
In-Reply-To: <1429458151-20049-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429458151-20049-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429458151-20049-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libart/libart.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libart/libart.hash

diff --git a/package/libart/libart.hash b/package/libart/libart.hash
new file mode 100644
index 0000000..769c3bf
--- /dev/null
+++ b/package/libart/libart.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/libart_lgpl-2.3.21.sha256sum
+sha256	2a10b1c884bb37c7bd5c5eba59dbd0d28bf68e64a42d7f2083c836f60f8e98fa	libart_lgpl-2.3.21.tar.gz
-- 
1.7.10.4
