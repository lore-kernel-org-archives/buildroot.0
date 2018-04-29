From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 11:47:52 +0200
Subject: [Buildroot] [PATCH 1/1] libao: add hash for license file
Message-ID: <20180429094752.14013-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libao/libao.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libao/libao.hash b/package/libao/libao.hash
index 64174dad8f..dced3dddeb 100644
--- a/package/libao/libao.hash
+++ b/package/libao/libao.hash
@@ -1,2 +1,5 @@
 # From http://downloads.xiph.org/releases/ao/SHA256SUMS.txt
 sha256	03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf	libao-1.2.0.tar.gz
+
+# Hash for license file:
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
-- 
2.14.1
