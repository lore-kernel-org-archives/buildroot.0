From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 17:07:50 +0100
Subject: [Buildroot] [PATCH 1/1] webp: add hash for license file
Message-ID: <20171202160750.32382-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/webp/webp.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webp/webp.hash b/package/webp/webp.hash
index e9b206090..3023bc6f4 100644
--- a/package/webp/webp.hash
+++ b/package/webp/webp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	c928119229d4f8f35e20113ffb61f281eda267634a8dc2285af4b0ee27cf2b40	libwebp-0.6.0.tar.gz
+sha256	5aec868f669e384a22372a4e8a1a6cd7d44c64cd451f960ca69cc170d1e13acf	COPYING
-- 
2.14.1
