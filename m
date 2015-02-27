From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Date: Fri, 27 Feb 2015 13:47:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmpdclient: add hash file
Message-ID: <1425041237-3204-1-git-send-email-syntheticpp@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
---
 package/libmpdclient/libmpdclient.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/libmpdclient/libmpdclient.hash

diff --git a/package/libmpdclient/libmpdclient.hash b/package/libmpdclient/libmpdclient.hash
new file mode 100644
index 0000000..93f372c
--- /dev/null
+++ b/package/libmpdclient/libmpdclient.hash
@@ -0,0 +1,3 @@
+# Verified against http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.10.tar.gz.sig, sha256 locally computed
+sha256 bf88ddd9beceadef11144811adaabe45008005af02373595daa03446e6b1bf3d  libmpdclient-2.10.tar.gz
+
-- 
2.3.0
