From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 10:39:16 +0200
Subject: [Buildroot] [PATCH 1/1] libnetfilter_cthelper: add hash for license
 file
Message-ID: <20180520083916.7984-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnetfilter_cthelper/libnetfilter_cthelper.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libnetfilter_cthelper/libnetfilter_cthelper.hash b/package/libnetfilter_cthelper/libnetfilter_cthelper.hash
index 5108652638..42deade7dd 100644
--- a/package/libnetfilter_cthelper/libnetfilter_cthelper.hash
+++ b/package/libnetfilter_cthelper/libnetfilter_cthelper.hash
@@ -1,3 +1,6 @@
 # From ftp://ftp.netfilter.org/pub/libnetfilter_cthelper/libnetfilter_cthelper-1.0.0.tar.bz2.{md5sum,sha1sum}
 md5	b2efab1a3a198a5add448960ba011acd	libnetfilter_cthelper-1.0.0.tar.bz2
 sha1	5d0a82794bd46aafde20c16800edca23d563de66	libnetfilter_cthelper-1.0.0.tar.bz2
+
+# Hash for license file:
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
-- 
2.14.1
