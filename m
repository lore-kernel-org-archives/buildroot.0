From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 13:46:41 +0200
Subject: [Buildroot] [PATCH 1/1] libosip2: add hash for license file
Message-ID: <20180520114641.20195-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libosip2/libosip2.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libosip2/libosip2.hash b/package/libosip2/libosip2.hash
index 9ff2d9a98a..c6df5f2362 100644
--- a/package/libosip2/libosip2.hash
+++ b/package/libosip2/libosip2.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
 sha256	c9a18b0c760506d150017cdb1fa5c1cefe12b8dcbbf9a7e784eb75af376e96cd	libosip2-3.6.0.tar.gz
+
+# Hash for license file:
+sha256	8d9e95ed0e48df46dc758eb0d86df611f771eab4eed94bebb77dca87f1c897de	COPYING
-- 
2.14.1
