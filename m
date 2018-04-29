From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 14:00:58 +0200
Subject: [Buildroot] [PATCH 1/1] libaio: add hash for license file
Message-ID: <20180429120058.3263-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libaio/libaio.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
index 7aa8961fbf..5917e2f783 100644
--- a/package/libaio/libaio.hash
+++ b/package/libaio/libaio.hash
@@ -1,2 +1,5 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/liba/libaio/libaio_0.3.110-1.dsc
 sha256	e019028e631725729376250e32b473012f7cb68e1f7275bfc1bbcdd0f8745f7e	libaio_0.3.110.orig.tar.gz
+
+# Hash for license file:
+sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING
-- 
2.14.1
