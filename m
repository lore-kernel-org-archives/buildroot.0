From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 29 Apr 2015 21:41:40 +0200
Subject: [Buildroot] [PATCH] ncftp: add hash file
Message-ID: <1430336500-11939-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ncftp/ncftp.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ncftp/ncftp.hash

diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
new file mode 100644
index 0000000..1169589
--- /dev/null
+++ b/package/ncftp/ncftp.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  b4ebe2415761a5137cd1d313c8fc1352f26d8963cc9e9e354e29720aa2089d42  ncftp-3.2.5-src.tar.bz2
-- 
2.1.0
