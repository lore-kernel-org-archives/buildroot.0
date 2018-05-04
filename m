From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 May 2018 21:23:53 +0200
Subject: [Buildroot] [PATCH 1/1] libmbus: add hash for license file
Message-ID: <20180504192353.29170-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmbus/libmbus.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmbus/libmbus.hash b/package/libmbus/libmbus.hash
index faf6a27ab7..91fe15ced1 100644
--- a/package/libmbus/libmbus.hash
+++ b/package/libmbus/libmbus.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	9fca42592da0ba75df66c6f885a4dbfa916d23e65e3d1ce6e38d940d2a2719a4	libmbus-0.8.0.tar.gz
+sha256	ea171a4ae443eca7186f564db2c3cc8b84c1ac343f227f92cd52ec6a948f4a74	COPYING
-- 
2.14.1
