From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 24 Oct 2015 10:58:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: add hash
Message-ID: <1445677095-12521-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I forgot to add the hash file in the 15.2 bump:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/130039

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/kodi/kodi.hash

diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
new file mode 100644
index 0000000..14af9af
--- /dev/null
+++ b/package/kodi/kodi.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	dd8aeb942e6de5d1488e243e1346cff3f6597e21b5131a3ba72ff5cc82037110	kodi-15.2-Isengard.tar.gz
-- 
2.6.1
