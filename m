From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 10:49:46 +0200
Subject: [Buildroot] [PATCH 1/1] libnfnetlink: add hash for license file
Message-ID: <20180520084946.9992-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnfnetlink/libnfnetlink.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libnfnetlink/libnfnetlink.hash b/package/libnfnetlink/libnfnetlink.hash
index 93844f22ee..3392d239b6 100644
--- a/package/libnfnetlink/libnfnetlink.hash
+++ b/package/libnfnetlink/libnfnetlink.hash
@@ -1,3 +1,6 @@
 # From ftp://ftp.netfilter.org/pub/libnfnetlink/libnfnetlink-1.0.1.tar.bz2.{md5sum,sha1sum}
 md5	98927583d2016a9fb1936fed992e2c5e	libnfnetlink-1.0.1.tar.bz2
 sha1	27ae2dfbd976e28cb7a417f9e946c901f512dd9a	libnfnetlink-1.0.1.tar.bz2
+
+# Hash for license file:
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
-- 
2.14.1
